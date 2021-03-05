#!/bin/bash

if [[ -e "/data/watcher.pid" ]]; then
    exit 0
else
    exit 1
fi
