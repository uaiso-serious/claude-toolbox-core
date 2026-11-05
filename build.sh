#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}" || exit
echo 'claude-toolbox-core'
git pull
docker build . -t ghcr.io/uaiso-serious/claude-toolbox-core:latest
