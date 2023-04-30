#!/bin/bash -xeu

RELEASE=$1
VERSION=$2
shift 2

cat \
        <(echo 'data:' ; echo -n '  release: ') \
        <(
            yq -o json . \
                | gzip \
                | base64 -w0 \
                | base64 -w0 \
        ) \
        <(echo) \
     | kubectl patch secrets "sh.helm.release.v1.${RELEASE}.v${VERSION}" \
         --patch-file=/dev/stdin \
         "$@" \
 
