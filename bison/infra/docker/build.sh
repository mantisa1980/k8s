#!/bin/bash
docker build -t bison-base .

echo "run command to load image to cluster if you use k3d"
echo "k3d image import bison-base:latest -c bison"