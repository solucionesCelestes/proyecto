#!/bin/bash

source "./colores.sh"

function apagarFirewall(){
    systemctl stop firewalld
    if [ $? -eq 0 ]; then
        mensajeVerde "✔ Firewall detenido correctamente."
    else
        mensajeRojo "✖ Error al detener el firewall."
    fi

    systemctl disable firewalld
    if [ $? -eq 0 ]; then
        mensajeVerde "✔ Firewall deshabilitado para el arranque."
    else
        mensajeRojo "✖ Error al deshabilitar el firewall."
    fi
}

apagarFirewall

