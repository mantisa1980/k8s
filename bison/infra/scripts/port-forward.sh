#!/bin/bash

# port mapping format: hostport:serviceport

#kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80 8443:443
#kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80 &
kubectl port-forward service/lobbysvc 80:80 &
kubectl port-forward service/redissvc 6379:6379 &
kubectl port-forward pod/mongors1-0 27017:27018
wait
