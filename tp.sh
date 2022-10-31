#! /bin/bash
# Autor: Exequiel Vazquez
# TP1

OPCION_DIRECTORIO="-d"
OPCION_NAVEGAR="-n"
OPCION_COPIAR="-c"
OPCION_PROCESOS="-p"
OPCION_HELP="--help"

NOMBRE_USUARIO=$(whoami)
ARCHIVO_LOG="tp.log"

function log(){
	echo [$(date)]  $@ >> $ARCHIVO_LOG
}

if [ $1 == $OPCION_DIRECTORIO ]; then
	mkdir $2
	log "Se creo una carpeta nueva llamada: " $2
fi

if [ $1 == $OPCION_NAVEGAR ]; then
	cd $2
	return
	log "Navegó hacia el directorio: " $2
fi

if [ $1 == $OPCION_COPIAR ]; then
	cp $2 $3
	log "Se copió el archivo: " $2 " en la ruta: " $3
fi

if [ $1 == $OPCION_PROCESOS ]; then
	ps -u $NOMBRE_USUARIO
	log "Se visualizo los procesos ejecutados por: " `whoami`
fi

if [[ $1 == $OPCION_HELP || $1 == " " ]]; then
	echo "Uso: ./tp.sh [OPCION]... [ARGUMENTO]...

Opciones:
-d: 		Crear nueva carpeta. Uso: 	[NOMBRE CARPETA]

-n: 		Navegar hacia un directorio distinto. Uso: 	. tp.sh [DIRECTORIO]

-c: 		Copiar archivo hacia otra ruta. Uso: 	[RUTA ARCHIVO] [RUTA DESTINO]

-p:  		Visualizar procesos ejecutados por el usuario actual. Uso: 	[USUARIO ACTUAL]

	"
fi

