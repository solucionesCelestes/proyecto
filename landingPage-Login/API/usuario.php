<?php
/* Clase usuario para gestionar con API RESTful
 * Permite operaciones CRUD (Crear, Leer, Actualizar, Eliminar)
 * Requiere conexión a una base de datos MySQL
 */

// Configuracion del reporte de errores
error_reporting(E_ERROR | E_PARSE);
ini_set('display_errors', 0);

class Usuario
{
	private $conn;

	// Constructor que recibe la conexión a la base de datos
	public function __construct($conn)
	{
		$this->conn = $conn;
	}

	// Métodos para manejar usuarios
	// Obtener todos los usuarios
	public function getAllUsuarios()
	{
		$query = "SELECT * FROM usuarios";
		$result = mysqli_query($this->conn, $query);
		$usuarios = [];
		while($row = mysqli_fetch_assoc($result)) {
			$usuarios[] = $row;
		}
		return $usuarios;
	}
	// Obtener un usuario por ID
	public function getUsuarioById($id)
	{
		$query = "SELECT * FROM usuarios WHERE ID = $id ";
		$result = mysqli_query($this->conn, $query);
		$usuario = mysqli_fetch_assoc($result);
		return $usuario;
	}
	// Agregar un nuevo usuario
	public function addUsuario($data)
	{
		echo 'data';
		print_r($data);
		if(!isset($data['Nombre']) || !isset($data['FotoPerfil']) || !isset($data['Email']) || !isset($data['Contrasena']) || !isset($data['Apellido']) || !isset($data['FechaNacimiento']) || !isset($data['Telefono'])) {
			http_response_code(400);
			return "Datos incompletos";
		}else{
			$usr_name = $data['Nombre'];
			$usr_email = $data['Email'];
			$usr_apellido = $data['Apellido'];
			$usr_fechanac = $data['FechaNacimiento'];
			$usr_tel = $data['Telefono'];
			$usr_pass = password_hash($data['Contrasena'], PASSWORD_DEFAULT);
			// Procesar imagen base64
			$img_data = $data['FotoPerfil'];
			if (preg_match('/^data:image\/(\w+);base64,/', $img_data, $type)) {
				$img_data = substr($img_data, strpos($img_data, ',') + 1);
				$img_data = base64_decode($img_data);
				$ext = strtolower($type[1]);
				$img_name = uniqid() . "." . $ext;
				$img_path = __DIR__ . "/fotosPerfiles/" . $img_name;
				if (!is_dir(__DIR__ . "/fotosPerfiles/")) {
					mkdir(__DIR__ . "/fotosPerfiles/", 0777, true);
				}
				if (file_put_contents($img_path, $img_data) === false) {
					http_response_code(500);
					return "No se pudo guardar la imagen";
					exit;
				}
			} else {
				http_response_code(400);
				return "Formato de imagen inválido";
				exit;
			}
			$query = "INSERT INTO usuarios (Nombre, Email, Apellido, FechaNacimiento, Telefono, Aceptado, Admin, Contrasena, FotoPerfil) VALUES ('$usr_name', '$usr_email', '$usr_apellido', '$usr_fechanac', '$usr_tel', '0', '0', '$usr_pass', '$img_path')";
			$result = mysqli_query($this->conn, $query);
			if($result){
				return true;
			} else {
				return false;
			}
		}
	}

	// Iniciar sesión de usuario
	public function loginUsuario($usr_email, $usr_pass)
	{
		//echo "email: $usr_email, pass: $usr_pass";
		$query = "SELECT * FROM usuarios WHERE Email = '$usr_email'";
		$result = mysqli_query($this->conn, $query);
		if(mysqli_num_rows($result) > 0){
			$usuario = mysqli_fetch_assoc($result);
			if(password_verify($usr_pass, $usuario['usr_pass'])){
				return $usuario; // Retorna el usuario si las credenciales son correctas
			} else {
				return false; // Contraseña incorrecta
			}
		} else {
			return false; // Usuario no encontrado
		}
	}

	// Actualizar un usuario por ID
	public function updateUsuario($id, $data)
	{
		$usr_name = $data['Nombre'];
		$usr_email = $data['Email'];
		$usr_pass = $data['Contrasena'];
		$usr_apellido = $data['Apellido'];
		$usr_fechanac = $data['FechaNacimiento'];
		$usr_tel = $data['Telefono'];
		$query = "UPDATE usuario SET Nombre = '$usr_name', Email = '$usr_email', Contrasena = '$usr_pass', Apellido = '$usr_apellido', FechaNacimiento = '$usr_fechanac', Telefono = '$usr_tel' WHERE ID = ".$id;
		$result = mysqli_query($this->conn, $query);
		if($result){
			return true;
		} else {
			return false;
		}
	}
	// Eliminar un usuario por ID
	public function deleteUsuario($id)
	{
		$query = "DELETE FROM usuarios WHERE ID = ".$id;
		$result = mysqli_query($this->conn, $query);
		if($result){
			return true;
		} else {
			return false;
		}
	}
}