from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = "supersecretkey"

# CONFIG MYSQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'muaythai_db'

mysql = MySQL(app)

# ------------------------
# HOME (PÚBLICO)
# ------------------------
@app.route('/')
def index():
    return render_template('index.html')

# ------------------------
# REGISTER
# ------------------------
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                    (username, email, password))
        mysql.connection.commit()
        cur.close()

        flash("Usuario registrado correctamente")
        return redirect(url_for('login'))

    return render_template('register.html')

# ------------------------
# LOGIN
# ------------------------
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()

        if user and check_password_hash(user[3], password):
            session['user_id'] = user[0]
            session['username'] = user[1]
            return redirect(url_for('dashboard'))
        else:
            flash("Credenciales incorrectas")

    return render_template('login.html')

# ------------------------
# DASHBOARD (PRIVADO)
# ------------------------
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM trainings WHERE user_id = %s", (session['user_id'],))
    trainings = cur.fetchall()
    cur.close()

    return render_template('dashboard.html', trainings=trainings)

# ------------------------
# AÑADIR ENTRENAMIENTO
# ------------------------
@app.route('/add_training', methods=['GET', 'POST'])
def add_training():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        title = request.form['title']
        description = request.form['description']
        date = request.form['date']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO trainings (title, description, date, user_id) VALUES (%s, %s, %s, %s)",
                    (title, description, date, session['user_id']))
        mysql.connection.commit()
        cur.close()

        return redirect(url_for('dashboard'))

    return render_template('add_training.html')

# ------------------------
# LOGOUT
# ------------------------
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

# ------------------------
# ABOUT ME
# ------------------------
@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run(debug=True)