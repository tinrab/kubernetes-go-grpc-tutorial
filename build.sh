#!/bin/bash

protoc -I ./pb --go_out=plugins=grpc:./pb ./pb/*.proto

docker build -t local/gcd -f Dockerfile.gcd .
docker build -t local/api -f Dockerfile.api .

kubectl apply -f api.yaml
kubectl apply -f gcd.yaml
