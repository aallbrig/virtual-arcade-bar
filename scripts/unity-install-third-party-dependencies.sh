#!/usr/bin/env bash

if [[ -n "${DEBUG}" ]] ; then
  set -ex
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
. "${SCRIPT_DIR}"/docker-config.sh

dotnet_path="${DOTNET_PATH:-/Applications/Unity/Hub/Editor/"${UNITY_VERSION}"/Unity.app/Contents/NetCore/"${UNITY_NETCORE_SDK_VERSION}"/dotnet}"
proj_path="${PROJECT_PATH:-~/src/virtual-arcade-bar/unity/virtual-arcade-bar/Playmode.csproj}"

# "${dotnet_path}" add "${proj_path}" package NSubstitute --version 4.3.0
# Above command doesn't work. Error returned indicates that unity csproj files do not accept
# adding packages using dotnet
# error output from above command
# info : Adding PackageReference for package 'NSubstitute' into project '/Users/aallbright/src/virtual-arcade-bar/unity/virtual-arcade-bar/Playmode.csproj'.
# error: Error while adding package 'NSubstitute' to project '/Users/aallbright/src/virtual-arcade-bar/unity/virtual-arcade-bar/Playmode.csproj'. The project does not support adding package references through the add package command.

# Brainstorm solution: I just need the NSubstitute dll in the ./Assets/Editor folder
# - Can't install package globally, can install package to output directory
# - New dotnet proj, install NSubstitute, then build/extract the dll into desired project?

if [[ -n "${DEBUG}" ]] ; then
  set +ex
fi
