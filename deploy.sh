#!/bin/bash

BASEDIR=$(dirname $0)

function deploy_stack {
    if [ -x ${BASEDIR}/$1/deploy.sh ]; then
        ${BASEDIR}/$1/deploy.sh
        echo "Deployed stack $1"
    else
        echo "Unknown stack $1"
    fi    
}

if [ $# -eq 1 ]; then
    if [ $1 == "all" ]; then
        for STACK in traefik portainer monitor wordpress elasticsearch; do
            deploy_stack ${STACK}
        done
    else
        deploy_stack $1
    fi
else
    echo "Enter stack name (or all)"
fi
