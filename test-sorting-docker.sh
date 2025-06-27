#!/bin/bash

# use latest official build image from branch main
#IMAGE="ghcr.io/matthiasbalke/sortphotos-integrationtest:master"
# use local build image
IMAGE="matthiasbalke/sortphotos-integrationtest:local"

echo ">> resetting test bed..."
rm -rf test/target/* || true
echo "done."
echo ""

#echo ">> updating docker image..."
#docker pull ${IMAGE}
#echo "done."
#echo ""

echo ">> sorting images..."
docker run \
  --mount type=bind,src=$(pwd)/test/source,dst=/source \
  --mount type=bind,src=$(pwd)/test/target,dst=/target \
  --rm -it ${IMAGE} \
  $@ --recursive --copy /source /target
echo "done."
echo ""

echo ">> listing target..."
ls -alR --color test/target
echo "done."
