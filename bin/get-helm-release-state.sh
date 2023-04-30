#!/bin/bash -xeu

RELEASE=$1
VERSION=$2
shift 2

kubectl get secrets "sh.helm.release.v1.${RELEASE}.v${VERSION}" \
    --template '{{ .data.release }}' \
    "$@" \
    | base64 -d \
    | base64 -d \
    | gunzip \
    | yq --indent=2 -P .
