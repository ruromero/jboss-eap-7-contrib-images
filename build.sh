#!/bin/bash

set -ueo pipefail

if [ -n "${DEBUG:-}" ] ; then
    set -x
fi

DRIVERS=( db2-driver-image derby-driver-image mssql-driver-image oracle-driver-image mariadb-driver-image )

for driver in "${DRIVERS[@]}"
do
    echo Building $driver
    version=$(grep version ${driver}/Dockerfile | awk -F"=" '{print $2}' | sed 's/"//g')
    docker build -f $driver/Dockerfile . -t $driver:$version
done