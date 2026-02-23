#!/usr/bin/env bash
set -euo pipefail

check_cmd() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    printf "[ok]   %s -> %s\n" "$name" "$(command -v "$name")"
  else
    printf "[miss] %s\n" "$name"
  fi
}

echo "== Tooling check =="
check_cmd python3
check_cmd pip3
check_cmd docker
check_cmd docker-compose

if command -v docker >/dev/null 2>&1; then
  echo "docker version: $(docker --version || true)"
  echo "compose version: $(docker compose version || true)"
else
  echo "docker is missing. You can still run API/tests without docker via Makefile targets."
fi
