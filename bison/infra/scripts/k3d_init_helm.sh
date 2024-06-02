#!/bin/bash
# rename the k3d name or change its path, if necessary (ex. k3d.exe to k3d)
# to delete cluster, run: (note: persistent volume of the cluster will be gone!)
# k3d delete cluster bison
srcDir=$(pwd)

echo "Note! Override the --volume parameter below to point to your source code path!"
read -p "Press Enter to use the default volume path or provide your volume path: " userVolumePath

# Default volume path
defaultVolumePath="C:\\Users\\manti\\code\\github\\k8s\\bison\\src:/data"

# Use user-provided volume path if available, otherwise use the default
if [ -z "$userVolumePath" ]; then
  volumePath=$defaultVolumePath
else
  volumePath=$userVolumePath
fi

~/k3d cluster create bison --api-port 6550 \
--volume "$volumePath" \
-p "80:80@loadbalancer" -p "8000:8000@loadbalancer" -p "443:443@loadbalancer" --agents 2


echo "loading bison-base image ..."

~/k3d image load bison-base -c bison

echo "Press any key to begin Helm install..."
read dummy

helm install bison-dev ../helm/dev

echo "Press any key to begin MongoDB replicaset setup..."
echo "make sure 3 mongo pods are running (run: kubectl get pods)"

read dummy

bash init_rs.sh

echo "next: run port-forwarding to make service port exposed"