<?php
error_reporting(E_ERROR | E_PARSE);
ini_set('display_errors', 0);

class Usuario
{
    private $conn;
    private $table_name = "usuarios";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getAllUsuarios()
    {
        $query = "SELECT * FROM usuarios";
        $result = mysqli_query($this->conn, $query);
        $usuarios = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $usuarios[] = $row;
        }
        return $usuarios;
    }

    public function getUsuarioById($id)
    {
        $id = intval($id);
        $query = "SELECT * FROM usuarios WHERE ID = $id";
        $result = mysqli_query($this->conn, $query);
        return mysqli_fetch_assoc($result);
    }

    public function addUsuario($data)
    {
        if (
            !isset($data['Nombre']) || !isset($data['FotoPerfil']) || !isset($data['Email']) ||
            !isset($data['Contrasena']) || !isset($data['Apellido']) ||
            !isset($data['FechaNacimiento']) || !isset($data['Telefono'])
        ) {
            http_response_code(400);
            return "Datos incompletos";
        }

        $usr_name = mysqli_real_escape_string($this->conn, $data['Nombre']);
        $usr_email = mysqli_real_escape_string($this->conn, $data['Email']);
        $usr_apellido = mysqli_real_escape_string($this->conn, $data['Apellido']);
        $usr_fechanac = mysqli_real_escape_string($this->conn, $data['FechaNacimiento']);
        $usr_tel = mysqli_real_escape_string($this->conn, $data['Telefono']);
        $usr_pass = password_hash($data['Contrasena'], PASSWORD_DEFAULT);

        $img_data = $data['FotoPerfil'];
        if (preg_match('/^data:image\/(\w+);base64,/', $img_data, $type)) {
            $img_data = substr($img_data, strpos($img_data, ',') + 1);
            $img_data = base64_decode($img_data);
            $ext = strtolower($type[1]);
            $img_name = uniqid() . "." . $ext;
            $rutaCarpeta = __DIR__ . "/fotosPerfiles/";
            $rutaCompleta = $rutaCarpeta . $img_name;
            $rutaRelativa = "fotosPerfiles/" . $img_name;

            if (!is_dir($rutaCarpeta)) {
                mkdir($rutaCarpeta, 0777, true);
            }

            if (file_put_contents($rutaCompleta, $img_data) === false) {
                http_response_code(500);
                return "No se pudo guardar la imagen";
            }
        } else {
            http_response_code(400);
            return "Formato de imagen inválido";
        }

        $query = "INSERT INTO usuarios 
            (Nombre, Email, Apellido, FechaNacimiento, Telefono, Aceptado, Admin, Contrasena, FotoPerfil)
            VALUES 
            ('$usr_name', '$usr_email', '$usr_apellido', '$usr_fechanac', '$usr_tel', '0', '0', '$usr_pass', '$rutaRelativa')";

        return mysqli_query($this->conn, $query);
    }

    public function loginUsuario($usr_email, $usr_pass)
    {
        $usr_email = mysqli_real_escape_string($this->conn, $usr_email);
        $query = "SELECT * FROM usuarios WHERE Email = '$usr_email'";
        $result = mysqli_query($this->conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $usuario = mysqli_fetch_assoc($result);
            if (password_verify($usr_pass, $usuario['Contrasena'])) {
                return $usuario;
            }
        }
        return false;
    }

    public function updateUsuario($id)
    {
        $id = intval($id);
        $query = "UPDATE usuarios SET Aceptado = '1' WHERE ID = $id";
        return mysqli_query($this->conn, $query);
    }

    public function deleteUsuario($id)
    {
        $id = intval($id);
        // Buscar la ruta de la foto antes de eliminar el usuario
        $queryFoto = "SELECT FotoPerfil FROM usuarios WHERE ID = $id";
        $result = mysqli_query($this->conn, $queryFoto);

        if ($result && mysqli_num_rows($result) > 0) {
            $usuario = mysqli_fetch_assoc($result);
            $fotoRuta = __DIR__ . "/" . $usuario['FotoPerfil'];

            // Eliminar la foto del sistema de archivos si existe
            if (file_exists($fotoRuta)) {
                unlink($fotoRuta);
            }
        }
        $query = "DELETE FROM usuarios WHERE ID = $id";
        return mysqli_query($this->conn, $query);
    }
}
