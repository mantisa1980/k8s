#!/bin/bash

# Start port-forwarding for Nginx

# for forwarding multiple ports, type:
#kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80 8443:443
kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80
