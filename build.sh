#!/bin/bash

DELAY=${SYNTHETIC_BUILD_DELAY:-60}

RUN_ID=$(LC_ALL=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 6)

log() {
    echo "[${RUN_ID}] $1"
}

log "Starting build with synthetic delay of ${DELAY} seconds..."

elapsed=0
while [ $elapsed -lt $DELAY ]; do
    sleep 5
    elapsed=$((elapsed + 5))
    if [ $elapsed -le $DELAY ]; then
        log "Waiting... ${elapsed}s / ${DELAY}s"
    fi
done

log "Synthetic delay complete. Running yarn install..."

yarn --frozen-lockfile install
