#!/usr/bin/env just --working-directory ./ --justfile

# COLOR
RED := "\\u001b[31m"
GREEN := "\\u001b[32m"
YELLOW := "\\u001b[33m"
RESET := "\\u001b[0m"

set dotenv-load

_default:
    @just --list --unsorted

# Help
help:
    @just

up: _download_actions-runner
    docker compose --env-file ./.env up -d

down:
    docker compose down

restart: down up

rebuild: _download_actions-runner
    docker compose build --no-cache

[private]
_download_actions-runner:
    #!/usr/bin/env bash

    if [ ! -f "actions-runner-linux-x64-2.328.0.tar.gz" ]; then
        curl -O -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
        echo "01066fad3a2893e63e6ca880ae3a1fad5bf9329d60e77ee15f2b97c148c3cd4e ./actions-runner-linux-x64-2.328.0.tar.gz" | sha256sum --check --status
    fi
