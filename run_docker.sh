#! /bin/bash

set -e

image=srp33/deconfounding_expression:version1

docker build -t $image .

mkdir -p data outputs tmp
#mkdir -p data/simulated_expression/optimizations data/bladderbatch data/gse20194 data/tcga data/tcga_medium data/tcga_small
#mkdir -p outputs/figures outputs/metrics outputs/optimizations outputs/tables

#docker run -i -t --rm \
docker run -i --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd)/data:/data \
  -v $(pwd)/outputs:/outputs \
  -v $(pwd)/scripts:/scripts \
  -v $(pwd)/tmp:/tmp \
  $image \
  bash -c /scripts/all.sh

#chmod 777 outputs -R
