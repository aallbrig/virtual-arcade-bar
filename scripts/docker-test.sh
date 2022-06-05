#!/usr/bin/env bash
set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh
test_counter=0

DEPENDENCIES=(docker)
for required_executable in "${DEPENDENCIES[@]}" ; do
  if ! which "${required_executable}" > /dev/null ; then
    echo "❌ required executable \"${required_executable}\" is not defined"
    exit 1
  fi
done

# I am able to interact with the blender CLI inside the custom docker container
if docker run --rm -it "${CUSTOM_IMAGE_TAG}" blender -b --version ; then
  echo "✅ $((++test_counter)) Docker based unity builder was able to interact with the blender CLI"
else
  echo "❌ $((++test_counter)) Something went wrong with the docker based blender CLI test"
fi

# I am able to interact with the unity CLI inside the custom docker container
if docker run --rm -it "${CUSTOM_IMAGE_TAG}" /root/Unity/Hub/Editor version ; then
  echo "✅ $((++test_counter)) Docker based unity builder was able to interact with the blender CLI"
else
  echo "❌ $((++test_counter)) Something went wrong with the docker based blender CLI test"
fi

set +ex
