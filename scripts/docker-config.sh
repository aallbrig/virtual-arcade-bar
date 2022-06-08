#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

export UNITY_VERSION='2020.3.35f1'
export UNITY_SERIAL='F4-DMQW-KHC3-F6PK-QSQK-JAT6'
export GAME_CI_VERSION='1.0.1'
export MY_DOCKER_USERNAME='aallbrig'

export BUILD_TARGET=WebGL
export BUILD_NAME=WebGL
export BUILD_PATH=build/WebGL
export BUILD_FILE=WebGL

export UNITY_PROJECT_NAME='virtual-arcade-bar'
export PROJECT_WORKDIR="$(pwd)/unity/${UNITY_PROJECT_NAME}"
export GITHUB_ACTOR='aallbrig'
export GITHUB_REPOSITORY='aallbrig/virtual-arcade-bar'
export CUSTOM_IMAGE_TAG="aallbrig/editor:ubuntu-${UNITY_VERSION}-webgl-${GAME_CI_VERSION}"

function Factory::UnityBuilderCommand() {
  docker run \
     --rm \
     --env UNITY_LICENSE \
     --env UNITY_SERIAL \
     --env UNITY_VERSION \
     --env PROJECT_PATH=unity/virtual-arcade-bar \
     --env BUILD_TARGET \
     --env BUILD_NAME \
     --env BUILD_PATH \
     --env BUILD_FILE \
     "${CUSTOM_IMAGE_TAG}" \
     "$@"
}

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
