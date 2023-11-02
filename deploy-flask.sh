#!/bin/bash

git pull
if [ $? != 0 ]; then
    echo "git pull failed, check the server logs!"
    exit 1
fi

if ! [ -d "$HOME/language-APIs/nic/flask/" ]; then
    echo 'repo does not exist!'
    exit 1
fi

cd $HOME/language-APIs/nic/flask/
docker compose up --build -d
if [ $? != 0 ]; then
    echo "docker compose failed, check the server logs!"
    exit 1
fi
