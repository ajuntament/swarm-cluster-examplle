#!/bin/bash

function create_dir {
    if [ ! -d $1 ]; then
        mkdir -p $1
        chmod -R 1777 $1
    fi 
}

function deploy {
    docker stack deploy -c ${BASEDIR}/$1/stack.yaml $1
}

IP1=$(curl ifconfig.me)
IP2=$(getent hosts maquina-02 | awk '{print $1}')
IP3=$(getent hosts maquina-03 | awk '{print $1}')
export IP1 IP2 IP3

BASEDIR=$(dirname $0)

if [ $# -eq 1 ]; then
    deploy $1
    exit 0
fi

deploy traefik

create_dir /opt/docker/portainer/volumes/portainer
deploy portainer

#deploy consul-cluster
#deploy comptador

create_dir /opt/docker/wordpress/volumes/database
deploy wordpress

create_dir /opt/docker/elastic/volumes/elasticsearch
deploy logspout-elk

create_dir /opt/docker/monitor/volumes/grafana
create_dir /opt/docker/monitor/volumes/influxdb
deploy monitor
