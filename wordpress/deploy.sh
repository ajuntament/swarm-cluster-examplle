#!/bin/bash

function create_dir {
    if [ ! -d $1 ]; then
        mkdir -p $1
        chmod -R 1777 $1
    fi 
}

#IP1=$(curl ifconfig.me)
IP1="34.77.241.213"
IP2=$(getent hosts maquina-02 | awk '{print $1}')
IP3=$(getent hosts maquina-03 | awk '{print $1}')
export IP1 IP2 IP3

BASEDIR=$(dirname $0)

create_dir /opt/docker/wordpress/volumes/database
docker stack deploy -c ${BASEDIR}/stack.yaml wordpress
