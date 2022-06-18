#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

export UNITY_VERSION='2020.3.35f1'
export UNITY_NETCORE_SDK_VERSION='Sdk-2.2.107'
# This (may) have something to do with PRO license
# export UNITY_SERIAL='F4-DMQW-KHC3-F6PK-QSQK-JAT6'
export GAME_CI_VERSION='1.0.1'
export MY_DOCKER_USERNAME='aallbrig'

export BUILD_TARGET=WebGL
export BUILD_NAME=WebGL
export BUILD_PATH=build/WebGL
export BUILD_FILE=WebGL
export VERSION=0.0.34 # Not sure what this is a version for

export UNITY_PROJECT_NAME='virtual-arcade-bar'
export PROJECT_WORKDIR="$(pwd)/unity/${UNITY_PROJECT_NAME}"
export GITHUB_ACTOR='aallbrig'
export GITHUB_REPOSITORY='aallbrig/virtual-arcade-bar'
export CUSTOM_IMAGE_TAG="aallbrig/editor:ubuntu-${UNITY_VERSION}-webgl-${GAME_CI_VERSION}"

function Factory::UnityBuilderCommand() {
  # Reference docker run command from GitHub Actions
  # docker run \
  # --workdir /github/workspace \
  # --rm
  # --env UNITY_LICENSE
  # --env UNITY_SERIAL=*HIDDEN*
  # --env UNITY_VERSION=2020.3.35f1
  # --env PROJECT_PATH=unity/virtual-arcade-bar
  # --env BUILD_TARGET=WebGL
  # --env BUILD_NAME=WebGL
  # --env BUILD_PATH=build/WebGL
  # --env BUILD_FILE=WebGL
  # --env VERSION=0.0.34
  # --env ANDROID_VERSION_CODE=34
  # --env GITHUB_REF=refs/heads/main
  # --env GITHUB_SHA=*HIDDEN*
  # --env GITHUB_REPOSITORY=aallbrig/virtual-arcade-bar
  # --env GITHUB_ACTOR=aallbrig
  # --env GITHUB_WORKFLOW=Unity CI CD Pipeline
  # --env GITHUB_EVENT_NAME=push
  # --env GITHUB_WORKSPACE=/github/workspace
  # --env GITHUB_ACTION=builds
  # --env GITHUB_EVENT_PATH=/home/runner/work/_temp/_github_workflow/event.json
  # --env RUNNER_OS=Linux
  # --env RUNNER_TOOL_CACHE=/opt/hostedtoolcache
  # --env RUNNER_TEMP=/home/runner/work/_temp
  # --env RUNNER_WORKSPACE=/home/runner/work/virtual-arcade-bar
  # --env UNITY_SERIAL
  # --env GITHUB_WORKSPACE=/github/workspace
  # --volume /home/runner/work/_temp/_github_home:/root:z
  # --volume /home/runner/work/_temp/_github_workflow:/github/workflow:z
  # --volume /home/runner/work/virtual-arcade-bar/virtual-arcade-bar:/github/workspace:z
  # --volume /home/runner/work/_actions/game-ci/unity-builder/v2/dist/default-build-script:/UnityBuilderAction:z
  # --volume /home/runner/work/_actions/game-ci/unity-builder/v2/dist/platforms/ubuntu/steps:/steps:z
  # --volume /home/runner/work/_actions/game-ci/unity-builder/v2/dist/platforms/ubuntu/entrypoint.sh:/entrypoint.sh:z
  # aallbrig/editor:ubuntu-2020.3.35f1-webgl-1.0.1 /bin/bash -c /entrypoint.sh
  docker run \
    --rm \
    --env UNITY_LICENSE \
    --env UNITY_EMAIL \
    --env UNITY_PASSWORD \
    --env VERSION \
    --env PROJECT_PATH=unity/virtual-arcade-bar \
    --env BUILD_TARGET \
    --env BUILD_NAME \
    --env BUILD_PATH \
    --env BUILD_FILE \
    --env ANDROID_VERSION_CODE=34 \
    --volume "${PROJECT_WORKDIR}":/root:z \
    "${CUSTOM_IMAGE_TAG}" \
    "$@"
}

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
