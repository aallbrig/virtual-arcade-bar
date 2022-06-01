#!/usr/bin/env bash

set -ex

export UNITY_VERSION=2020.3.35f1
export GAME_CI_VERSION=1.0.1
export MY_DOCKER_USERNAME=aallbrig

if docker run --rm -it aallbrig/editor:ubuntu-2020.3.35f1-webgl-1.0.1 blender version ; then
  echo "✅ Docker based unity builder was able to interact with the blender CLI"
else
  echo "❌ Something went wrong with the docker based blender CLI test"
fi
