#!/usr/bin/env bash

set -ex

export UNITY_VERSION='2020.3.35f1'
export UNITY_SERIAL='F4-DMQW-KHC3-F6PK-QSQK-JAT6'
export GAME_CI_VERSION='1.0.1'
export MY_DOCKER_USERNAME='aallbrig'

export UNITY_PROJECT_NAME='virtual-arcade-bar'
export PROJECT_WORKDIR="$(pwd)/unity/${UNITY_PROJECT_NAME}"
export GITHUB_ACTOR='aallbrig'
export GITHUB_REPOSITORY='aallbrig/virtual-arcade-bar'
export CUSTOM_IMAGE_TAG="aallbrig/editor:ubuntu-${UNITY_VERSION}-webgl-${GAME_CI_VERSION}"

set +ex
