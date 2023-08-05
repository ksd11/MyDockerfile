#!/bin/bash

source ../util/print.sh

VERSION=latest
IMAGE=$(basename $(pwd))

set -e

docker build -t $IMAGE:$VERSION .

docker run $IMAGE:$VERSION
