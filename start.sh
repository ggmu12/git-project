#!/bin/bash

GH_OWNER=ggmu12
GH_REPOSITORY=git-project
GH_TOKEN=A3EUPOYQGRXA6OJAQ7SKPQTDE7LFO

cd /home/gitdocker/actions-runner

./config.sh --unattended --url https://github.com/${GH_OWNER}/${GH_REPOSITORY} --token ${GH_TOKEN}

cleanup() {
            echo "Removing runner..."
                ./config.sh remove --unattended --token ${GH_TOKEN}
        }

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
