#!/bin/bash
set -e

docker build -t jscheel42/build:latest --no-cache --pull .
if [ "$1" == "push" ]
then
    docker push jscheel42/build:latest
fi

if [[ -v BUILD_NUMBER ]]
then
    docker tag jscheel42/build:latest jscheel42/build:$BUILD_NUMBER
    docker push jscheel42/build:$BUILD_NUMBER
fi