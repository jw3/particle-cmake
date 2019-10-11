#!/usr/bin/env bash

if [[ -d ${1} ]]; then
    for p in $(ls ${1}/*.patch 2> /dev/null); do
      patch --dry-run -N --silent --binary -p 1 -i ${p}
      if [ $? -eq 0 ]; then
        patch --binary -p 1 -i ${p}
      fi
    done
fi
