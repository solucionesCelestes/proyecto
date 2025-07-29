#!/bin/bash

source "./colores.sh"

function crearUsuario(){
    usuario=$1
    echo "Creando usuario... $usuario"

    if grep -q "^$usuario:" /etc/passwd; then
        mensajeRojo "El usuario $usuario ya existe."
    else
        useradd -m -g wheel "$usuario"
        echo "Usuario $usuario creado y agregado al grupo administrador (wheel)."
    fi
}

crearUsuario "Franco_Peroni"
crearUsuario "Nahuel_Rocha"
crearUsuario "Fermin_Santillan"
crearUsuario "Trilce_Garcia"

