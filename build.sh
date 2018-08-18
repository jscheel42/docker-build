#!/bin/bash

docker build -t jscheel42/build --no-cache --pull .
if [ "$1" == "push" ]
then
    docker push jscheel42/build
fi