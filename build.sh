#!/bin/bash
set -e

docker build -t jscheel42/build --no-cache --pull asdf
if [ "$1" == "push" ]
then
    docker push jscheel42/build
fi