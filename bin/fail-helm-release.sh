#!/bin/bash -xeu

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

RELEASE=$1
VERSION=$2
shift 2

exec "${SCRIPTPATH}/mutate-helm-release-state.sh" "${RELEASE}" "${VERSION}" '.info.status |= "failed"' "$@"
