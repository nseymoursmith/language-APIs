#!/bin/bash

git pull
if [ $? != 0 ]; then
    echo "git pull failed, check the server logs!"
    exit 1
fi

docker compose up -- build -d
if [ $? != 0 ]; then
    echo "docker compose failed, check the server logs!"
    exit 1
fi
