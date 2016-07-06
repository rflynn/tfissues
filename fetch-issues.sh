#!/bin/bash

# ref: https://developer.github.com/v3/#schema

set -x
set -e
set -o pipefail

mkdir -p issues/{open,closed}/

fetch_issues()
{
    state=$1
    n100=$2
    for i in $(seq 1 $n100)
    do
        url="https://api.github.com/repos/tensorflow/tensorflow/issues?state=$state&page=$i&per_page=100"
        dest="issues/$state/$(printf '%03d' $i).json"
        if ! [ -f $dest ]
        then
            curl "$url" > $dest
            sleep 2  # be nice
        fi
    done
}

# FIXME: how do we calculate these magical numbers?
fetch_issues open 4
fetch_issues closed 16

# curl https://api.github.com/repos/tensorflow/tensorflow/issues > issues.json

