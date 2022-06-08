#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh
test_counter=0

DEPENDENCIES=(docker)

desired_environment_variables=( \
  # Unity path is defined by parent game.ci docker image
  "UNITY_PATH" \
  "UNITY_LICENSE" \
  "UNITY_SERIAL" \
  "UNITY_VERSION" \
  "PROJECT_PATH" \
  "BUILD_TARGET" \
  "BUILD_NAME" \
  "BUILD_PATH" \
  "BUILD_FILE" \
)

function main() {
  # ☑️ Script dependencies are found
  for required_executable in "${DEPENDENCIES[@]}" ; do
    if ! which "${required_executable}" > /dev/null ; then
      echo "❌ required executable \"${required_executable}\" is not defined"
      exit 1
    fi
  done

  # ☑️ I am able to interact with the blender CLI inside the custom docker container
  args=(blender -b --version)
  if Factory::UnityBuilderCommand "${args[@]}" > /dev/null ; then
    echo "✅ $((++test_counter)) Docker based unity builder was able to interact with the blender CLI in docker image ${CUSTOM_IMAGE_TAG}"
  else
    echo "❌ $((++test_counter)) Something went wrong with the docker based blender CLI test"
  fi

  # ☑️ I am able to interact with the unity CLI inside the custom docker container
  # shellcheck disable=SC2016
  args=(/bin/bash -c '$UNITY_PATH/Editor/Unity -version')
  if Factory::UnityBuilderCommand "${args[@]}" > /dev/null ; then
    echo "✅ $((++test_counter)) Was able to interact with the Unity Editor CLI for docker image ${CUSTOM_IMAGE_TAG}"
  else
    echo "❌ $((++test_counter)) Unable to interact with the Unity Editor CLI -- check the command being provided to this test?"
  fi

  # ☑️ I am able to see desired environment variables
  for environment_variable in "${desired_environment_variables[@]}" ; do
    args=(/bin/bash -c "env | grep '^${environment_variable}'")
    if Factory::UnityBuilderCommand "${args[@]}"  > /dev/null ; then
      echo "✅ $((++test_counter)) Able to detect environment variable '${environment_variable}' inside docker image ${CUSTOM_IMAGE_TAG}"
    else
      echo "❌ $((++test_counter)) Unable to detect environment variable ${environment_variable} inside docker image ${CUSTOM_IMAGE_TAG}"
    fi
  done
}

main

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
