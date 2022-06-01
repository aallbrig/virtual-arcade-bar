#!/usr/bin/env bash

set -ex

declare UNITY_VERSION=2020.3.35f1
declare UNITY_SERIAL=F4-DMQW-KHC3-F6PK-QSQK-JAT6
declare GAME_CI_VERSION=1.0.1
declare MY_DOCKER_USERNAME=aallbrig
declare UNITY_PROJECT_NAME=virtual-arcade-bar
declare GITHUB_ACTOR=aallbrig
declare GITHUB_REPOSITORY=aallbrig/virtual-arcade-bar

if docker run --rm -it aallbrig/editor:ubuntu-2020.3.35f1-webgl-1.0.1 blender -b --version ; then
  echo "✅ Docker based unity builder was able to interact with the blender CLI"
else
  echo "❌ Something went wrong with the docker based blender CLI test"
fi

if docker run \
  --workdir "$(pwd)/unity/virtual-arcade-bar" \
  --rm \
  --env UNITY_LICENSE \
  --env UNITY_SERIAL \
  --env UNITY_SERIAL="${UNITY_SERIAL}" \
  --env UNITY_VERSION="${UNITY_VERSION}" \
  --env PROJECT_PATH=unity/"${UNITY_PROJECTR_NAME}" \
  --env BUILD_TARGET=WebGL \
  --env BUILD_NAME=WebGL \
  --env BUILD_PATH=build/WebGL \
  --env BUILD_FILE=WebGL \
  --env VERSION=0.0.7 \
  --env ANDROID_VERSION_CODE=7 \
  --env GITHUB_REF=refs/heads/main \
  --env GITHUB_REPOSITORY="${GITHUB_REPOSITORY}" \
  --env GITHUB_ACTOR="${GITHUB_ACTOR}" \
  --env GITHUB_WORKFLOW=Unity CI CD Pipeline \
  --env GITHUB_WORKSPACE="$(pwd)" \
  --volume "$(pwd)":/root:z \
  /bin/bash -c /entrypoint.sh \
; then
  echo "✅ Docker unity build succeeds"
else
  echo "❌ Docker unity build failed"
fi
