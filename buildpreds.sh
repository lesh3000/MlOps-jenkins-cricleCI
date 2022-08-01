#!/bin/bash

docker build --build-arg entry=test -t preds .
r=$(docker images -q preds)
echo $r
docker tag ${r} dmitrylesh/preds:latest
docker login -p="${pass}" -u=dmitrylesh
docker push dmitrylesh/preds:latest