#!/bin/bash

source ../util/print.sh

USER=ksd1
PASSWORD=123
PORT=2024

IMAGE=$(basename $(pwd))


docker rm `docker ps -a | grep Exited | grep $IMAGE | awk '{print $1}'`

# 删除所有ubuntu-with-ssh容器
# docker rm -f `docker ps -a | grep $IMAGE | awk '{print $1}'`

# 遇到错误则停止
set -e

sed -E -i "s/USER=\".+/USER=\"$USER\"/" Dockerfile
sed -E -i "s/PASSWORD=\".+/PASSWORD=\"$PASSWORD\"/" Dockerfile

# build
docker build -t $IMAGE .

# run
docker run -d -p $PORT:22 $IMAGE

# connect
success_message "[BUILD] success"
echo "please run: "
echo -e "\t ssh ${USER}@localhost -p $PORT"
echo to start your server

