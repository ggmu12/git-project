#!/bin/bash

GH_OWNER=ggmu12
GH_REPOSITORY=git-project
GH_TOKEN=A3EUPOYQGRXA6OJAQ7SKPQTDE7LFO


#REG_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GH_TOKEN}" https://api.github.com/repos/${GH_OWNER}/${GH_REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/actions-runner

./config.sh --unattended --url https://github.com/${GH_OWNER}/${GH_REPOSITORY} --token ${GH_TOKEN}

cleanup() {
            echo "Removing runner..."
                ./config.sh remove --unattended --token ${REG_TOKEN}
        }

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
