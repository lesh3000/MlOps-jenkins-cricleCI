#!/bin/bash

account="524768791364"
region="us-west-1"
repo="train"
#ß
docker build -t final .
r=$(docker images -q final)
echo $r
#echo ${account}.dkr.ecr.${region}.amazonaws.com/train
#docker tag ${r} ${account}.dkr.ecr.${region}.amazonaws.com/train
#aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${account}.dkr.ecr.${region}.amazonaws.com
#docker push ${account}.dkr.ecr.${region}.amazonaws.com/train
docker tag ${r} dmitrylesh/train:latest
docker login --password="${pass}" --login=dmitrylesh
docker push dmitrylesh/train:latest
