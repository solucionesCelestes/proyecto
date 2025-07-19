<?php
require_once 'config.php';
require_once 'usuario.php';

$usuarioObj = new Usuario($conn);
$method = $_SERVER['REQUEST_METHOD'];
$endpoint = $_SERVER['PATH_INFO'];
header('Content-Type: application/json');

switch ($method) {
    case 'GET':
        if ($endpoint === '/usuarios') {
            echo json_encode($usuarioObj->getAllUsuarios());
        } elseif (preg_match('/^\/usuarios\/(\d+)$/', $endpoint, $matches)) {
            $usuarioId = $matches[1];
            echo json_encode($usuarioObj->getUsuarioById($usuarioId));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);
        if ($endpoint === '/usuarios') {
            $result = $usuarioObj->addUsuario($data);
            if ($result === true) {
                http_response_code(201);
                echo json_encode(['success' => true]);
            } elseif ($result === false) {
                http_response_code(400);
                echo json_encode(['error' => 'Error al registrar usuario']);
            } else {
                http_response_code(400);
                echo json_encode(['error' => $result]);
            }
        } elseif ($endpoint === '/login') {
            $result = $usuarioObj->loginUsuario($data['usr_email'], $data['usr_pass']);
            if ($result) {
                echo json_encode(['success' => true, 'usuario' => $result]);
            } else {
                http_response_code(401);
                echo json_encode(['error' => 'Credenciales incorrectas']);
            }
        }
        break;

    case 'PUT':
        if (preg_match('/^\/usuarios\/(\d+)$/', $endpoint, $matches)) {
            $usuarioId = $matches[1];
            $result = $usuarioObj->updateUsuario($usuarioId);
            echo json_encode(['success' => $result]);
        }
        break;

    case 'DELETE':
        if (preg_match('/^\/usuarios\/(\d+)$/', $endpoint, $matches)) {
            $usuarioId = $matches[1];
            $result = $usuarioObj->deleteUsuario($usuarioId);
            echo json_encode(['success' => $result]);
        }
        break;

    default:
        header('Allow: GET, POST, PUT, DELETE');
        http_response_code(405);
        echo json_encode(['error' => 'Método no permitido']);
        break;
}
