#!/bin/bash

#kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80 8443:443
#kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80 &
kubectl port-forward service/redis-service 6379:6379 &
kubectl port-forward service/mongo1a 27018:27018

wait
