Muay Thai World 🥊

Este es mi proyecto de aplicación web sobre el deporte Muay Thai.
La aplicación está hecha con Python (Flask) y MySQL usando XAMPP.

¿Qué hace la aplicación?
-Permite registrarse
-Permite iniciar sesión
-Tiene una parte pública y una parte privada
-En la parte privada se pueden añadir entrenamientos
-Guarda los datos en una base de datos

Tecnologías usadas
-Python
-Flask
-MySQL
-HTML
-CSS

Base de datos
-Se utiliza una base de datos llamada: muaythai_db
-Tiene dos tablas:
users → guarda los usuarios
trainings → guarda los entrenamientos

Un usuario puede tener varios entrenamientos.

Cómo ejecutarlo
-Iniciar XAMPP (Apache y MySQL).
-Crear la base de datos en phpMyAdmin.
-Instalar las librerías:
    pip install flask flask-mysqldb werkzeug
-Ejecutar el archivo:
    python app.py
-Abrir en el navegador:
http://127.0.0.1:5000 o http://localhost:5000

Proyecto realizado por:
Jaume Morte Dominguez