#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh


# don't hesitate to remove unused components from this list
declare -a components=("webgl")

for component in "${components[@]}" ; do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-"${UNITY_VERSION}"-"${component}"-"${GAME_CI_VERSION}"
  IMAGE_TO_PUBLISH="${MY_DOCKER_USERNAME}"/editor:ubuntu-"${UNITY_VERSION}"-"${component}"-"${GAME_CI_VERSION}"

  if docker build \
    --build-arg GAME_CI_UNITY_EDITOR_IMAGE="${GAME_CI_UNITY_EDITOR_IMAGE}" \
    --file "$(pwd)"/Dockerfiles/unity-builder/Dockerfile \
    --tag "${IMAGE_TO_PUBLISH}" \
    "$(pwd)"/Dockerfiles/unity-builder ; then
      docker push "${IMAGE_TO_PUBLISH}"
  fi
done


if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
