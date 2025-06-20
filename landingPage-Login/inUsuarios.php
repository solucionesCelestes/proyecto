<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingreso de Usuarios</title>
    <link rel="stylesheet" href="stilos.css">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $email = $_POST["email"];
    $contrasenia = $_POST["contrasenia"];
    $fechaNac = $_POST["fechaNac"];
    $numTel = $_POST["numTel"];

    // Guardar imagen
    $archivo = $_FILES["fotoPerfil"];
    $archivoNombre = basename($archivo["name"]);
    $rutaDestino = "fotos/" . $archivoNombre;

    if (move_uploaded_file($archivo["tmp_name"], $rutaDestino)) {
        $rutaDestino = "$archivoNombre";
    } else {
        $rutaDestino = "Error al subir foto";
    }

    // Guardar datos en el archivo de texto
  //  $file = fopen("Contactos.txt", "a");
   // fwrite($file, "$nombre,$email,$contrasenia,$rutaDestino" . PHP_EOL);
    // fclose($file);

    // Database configuration
	$hostname = 'localhost';
	$username = 'root';
	$password = '';
	$database = 'base_usuarios';
	// Establish database connection
	$conn = mysqli_connect($hostname, $username, $password, $database);
	// Check connection
	if(!$conn){
		die('Connection failed: ' . mysqli_connect_error());
	}

	// Make query
	$query = "INSERT INTO base_usuarios.usuario(usr_name, usr_email, usr_pass, FotoPerfil, fecha_nac, num_tel) VALUES ('$nombre','$email','$contrasenia', '$archivoNombre', '$fechaNac', '$numTel');";
	$result = mysqli_query($conn, $query);
}

?>
<div class="usuarios1">
<h1>Usuario registrado!</h1>
<br>
<div class="div1"><a href="index.php">Ir al Inicio</a></div>
</div>
</body>
</html>