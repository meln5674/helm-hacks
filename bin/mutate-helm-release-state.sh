#!/bin/bash -xeu

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

RELEASE=$1
VERSION=$2
YQ_SCRIPT=$3
shift 3

ARGS=( "${RELEASE}" "${VERSION}" "$@" )

"${SCRIPTPATH}/get-helm-release-state.sh" "${ARGS[@]}" | yq "${YQ_SCRIPT}" | "${SCRIPTPATH}/put-helm-release-state.sh" "${ARGS[@]}"
