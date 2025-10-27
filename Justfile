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

# Start the containers
up: _download_actions-runner
    @echo -e "Make sure that the {{YELLOW}}RUNNER_TOKEN{{RESET}} is valid"
    docker compose pull
    docker compose build
    docker compose --env-file ./.env up -d

# Stop the containers
down:
    docker compose down

# Restart the container
restart: down up

# Rebuild the container
rebuild: _download_actions-runner
    docker compose build --no-cache

_download_actions-runner:
    #!/usr/bin/env bash

    if [ ! -f "actions-runner-linux-x64.tar.gz" ]; then
        curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.329.0/actions-runner-linux-x64-2.329.0.tar.gz
        echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d ./actions-runner-linux-x64.tar.gz" | sha256sum --check --status
    fi