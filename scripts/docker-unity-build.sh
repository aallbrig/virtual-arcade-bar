#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh

if docker run \
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
   /bin/bash -c /entrypoint.sh ; then
  echo "✅ Docker unity build succeeds"
else
  echo "❌ Docker unity build failed"
fi

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
