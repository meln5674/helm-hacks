# Helm Hacks

## Scripts for dealing with uncooperative helm releases

This repo contains scripts for modifying the internal state of a helm release as encoded in its secrets.

This repo assumes you have the following installed:

* kubectl
* [yq](https://mikefarah.gitbook.io/yq/)

### get-helm-release-state.sh RELEASE VERSION [ARGS...]

Write a helm release state decoded to YAML to standard output, providing any extra arguments to kubectl (e.g. --namespace)

### put-helm-release-state.sh RELEASE VERSION [ARGS...]

Read a YAML encoded helm release state from standard input and overwrite it entirely, providing any extra arguments to kubectl

### mutate-helm-release-state.sh RELEASE VERSION YQ_SCRIPT [ARGS...]

Apply a yq script to a helm release state and replace it with the result, providing any extra arguments to kubectl.

### fail-helm-release.sh RELEASE VERISON [ARGS...]

Set the status of a release to 'failed', applying any extra arguments to kubectl. This is useful if your helm install was interrupted, as you cannot rollback because you have no previous releases, and cannot fix forward because the next upgrade will refuse to start because it perceives it as still waiting for the initial install to succeed or fail. You can also use this to retroactively declare a release failed for whatever reason.
