#!/usr/bin/env bash

set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh

if docker run \
  --workdir "${PROJECT_WORKDIR}" \
  --rm \
  --env UNITY_LICENSE="${UNITY_LICENSE}" \
  --env UNITY_SERIAL="${UNITY_SERIAL}" \
  --env UNITY_VERSION="${UNITY_VERSION}" \
  --env PROJECT_PATH=unity/"${UNITY_PROJECT_NAME}" \
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
  --env GITHUB_EVENT_NAME=push \
  --env GITHUB_ACTION=builds \
  --env RUNNER_TEMP=/home/runner/work/_temp \
  --env RUNNER_WORKSPACE=/home/runner/work/virtual-arcade-bar \
  --volume "$(pwd)":/root:z \
  /bin/bash -c /entrypoint.sh ; then
  echo "✅ Docker unity build succeeds"
else
  echo "❌ Docker unity build failed"
fi
