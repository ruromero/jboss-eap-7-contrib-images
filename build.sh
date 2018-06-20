#!/bin/bash

set -ueo pipefail

if [ -n "${DEBUG:-}" ] ; then
    set -x
fi

DRIVERS=( db2-driver-image derby-driver-image mssql-driver-image oracle-driver-image mariadb-driver-image )

function build() {
    local driver=$1
    local tag=$2
    echo Building $driver
    docker build -f $driver/Dockerfile . -t $tag
    echo Finished bulding $tag
}

function push() {
    local tag=$1
    echo Pushing $tag
    docker push $tag
    echo Pushed $tag
}

function docker_login() {
    if [[ $(oc whoami -t > /dev/null; echo $?) == 1 ]]; then
        echo "You must be logged in"
        exit 1
    fi
    docker login -u `oc whoami` -p `oc whoami -t` docker-registry.default.svc:5000
}

docker_login

for driver in "${DRIVERS[@]}"
do
    version=$(grep version ${driver}/Dockerfile | awk -F"=" '{print $2}' | sed 's/"//g')
    tag=docker-registry.default.svc:5000/openshift/$driver:$version
    build $driver $tag
    push $tag
done