#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh

args=(/bin/bash -c /entrypoint.sh)
if Factory::UnityBuilderCommand "${args[@]}" ; then
  echo "✅ Docker unity build succeeds"
else
  echo "❌ Docker unity build failed"
fi

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
