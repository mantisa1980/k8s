#!/bin/bash
# rename the k3d name or change its path, if necessary (ex. k3d.exe)
# to delete cluster, run: (note: persistent volume of the cluster will be gone!)
# k3d delete cluster CLUSTER_NAME
~/k3d.exe cluster create bison

if [ $? -eq 0 ]; then
    echo "Cluster created successfully"
else
    echo "The command failed with status $?."
    exit 1
fi

echo "waiting for 30 seconds..."
sleep 30

# init frontend
cd frontend && kubectl create -f nginx.yml && kubectl create -f nginx_service.yml
echo "waiting for 10 seconds..."
sleep 10
echo "creating ingress for frontend..."
kubectl create -f ingress.yml

cd ..
# init redis
cd database && \
kubectl create -f redis-pv.yml &&\
kubectl create -f redis-pvc.yml &&
echo "waiting for 10 seconds for default service account to be ready ..."
sleep 10
kubectl create -f redis.yml &&\
kubectl create -f redis-service.yml &&\



cd ..
echo "cluster initialized successfully!"
echo "to port forward for internal redis service, run port_forward.sh manually"