#!/bin/bash

source "./colores.sh"

function agregarRepositorioEpel(){
    if [ -e /etc/yum.repos.d/epel.repo ]; then 
        mensajeAzul "El repositorio EPEL ya está instalado."
    else
        mensajeAzul "Instalando repositorio EPEL..."
        dnf install -y epel-release

        if [ $? -eq 0 ]; then
            mensajeVerde "✔ Repositorio EPEL instalado correctamente."
        else
            mensajeRojo "✖ Error al instalar el repositorio EPEL."
        fi
    fi
}

function instalarPaquetes(){
    mensajeAzul "Instalando paquetes: vim, htop, git, wget, curl..."
    dnf install -y vim htop git wget curl

    if [ $? -eq 0 ]; then
        mensajeVerde "✔ Paquetes instalados correctamente."
    else
        mensajeRojo "✖ Error al instalar los paquetes."
    fi
}

agregarRepositorioEpel
instalarPaquetes

