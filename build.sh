#!/bin/bash

DELAY=${SYNTHETIC_BUILD_DELAY:-60}

echo "Starting build with synthetic delay of ${DELAY} seconds..."

elapsed=0
while [ $elapsed -lt $DELAY ]; do
    sleep 5
    elapsed=$((elapsed + 5))
    if [ $elapsed -le $DELAY ]; then
        echo "Waiting... ${elapsed}s / ${DELAY}s"
    fi
done

echo "Synthetic delay complete. Running yarn install..."

yarn --frozen-lockfile install
