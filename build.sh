#!/bin/bash

set -ueo pipefail

if [ -n "${DEBUG:-}" ] ; then
    set -x
fi

function print_help() {
    echo "Builds and pushes JDBC Driver images to a docker registry."
    echo ""
    echo "Usage: "
    echo "   build.sh <DRIVER_1> [<DRIVER_2>...] [--registry=myregistry.example.com:5000]"
    echo "Options:"
    echo "   Available driver images to build: db2,derby,mssql,oracle,mariadb"
    echo "   --registry   Specifies the docker registry to use for tagging and pushing. Defaults to docker-registry.default.svc:5000"
}

declare -a drivers=()

while (($#))
do
    case $1 in
        db2|derby|mssql|oracle|mariadb)
            drivers+=($1-driver-image)
        ;;
        --registry=*)
            registry=${1#*=}
        ;;
        -h)
            print_help
            exit 0
        ;;
        --help)
            print_help
            exit 0
        ;;
    esac
shift
done

if [[ ${#drivers[@]} -eq 0 ]]
then
    print_help
    exit 1
fi

registry=${registry:-docker-registry.default.svc:5000}

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
    docker login -u `oc whoami` -p `oc whoami -t` $registry
}

docker_login

for driver in "${drivers[@]}"
do
    version=$(grep version ${driver}/Dockerfile | awk -F"=" '{print $2}' | sed 's/"//g')
    tag=$registry/openshift/$driver:$version
    build $driver $tag
    push $tag
done