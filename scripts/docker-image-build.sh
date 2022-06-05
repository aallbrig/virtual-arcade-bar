#!/usr/bin/env bash

set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh


# don't hesitate to remove unused components from this list
declare -a components=("webgl")

for component in "${components[@]}"
do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-"${UNITY_VERSION}"-"${component}"-"${GAME_CI_VERSION}"
  IMAGE_TO_PUBLISH="${MY_DOCKER_USERNAME}"/editor:ubuntu-"${UNITY_VERSION}"-"${component}"-"${GAME_CI_VERSION}"

  docker build \
    --build-arg GAME_CI_UNITY_EDITOR_IMAGE="${GAME_CI_UNITY_EDITOR_IMAGE}" \
    ./Dockerfiles/unity-builder \
    --file "$(pwd)"/Dockerfiles/unity-builder/Dockerfile \
    --tag "${IMAGE_TO_PUBLISH}"

  docker push "${IMAGE_TO_PUBLISH}"
done

set +ex
