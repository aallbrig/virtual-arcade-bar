#!/usr/bin/env bash

set -ex

export UNITY_VERSION=2020.3.35f1
export GAME_CI_VERSION=1.0.1
export MY_DOCKER_USERNAME=aallbrig

# don't hesitate to remove unused components from this list
declare -a components=("webgl")

for component in "${components[@]}"
do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  IMAGE_TO_PUBLISH=${MY_DOCKER_USERNAME}/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  docker build --build-arg GAME_CI_UNITY_EDITOR_IMAGE="${GAME_CI_UNITY_EDITOR_IMAGE}" ./Dockerfiles/unity-builder -f "$(pwd)"/Dockerfiles/unity-builder/Dockerfile -t "${IMAGE_TO_PUBLISH}"

  docker push "${IMAGE_TO_PUBLISH}"
done