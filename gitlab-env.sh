#!/bin/bash

export WORK_DIR=''

for file in `git diff-tree --no-commit-id --name-only -r $CI_COMMIT_SHA..$CI_COMMIT_BEFORE_SHA`;
do
  f=`basename $file`
  if [[ "$f" == "main.tf" ]]
  then
    export WORK_DIR=`dirname $file`
  fi
  [ -z $WORK_DIR ] && echo "$CI_COMMIT_SHA: nothing change" || echo "$CI_COMMIT_SHA: $WORK_DIR"
done
