#!/usr/bin/env bash
# TASK-105: run kas smoke builds and save logs under build-logs/ (gitignored).
# Prereq: Ubuntu 22.04 + ./scripts/setup-build-host.sh (lz4c and other HOSTTOOLS).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"
mkdir -p build-logs

echo "== u-boot (log: build-logs/u-boot.log) =="
kas build kas/elevator-hmi.yml --target u-boot 2>&1 | tee build-logs/u-boot.log

echo "== virtual/kernel (log: build-logs/virtual-kernel.log) =="
kas build kas/elevator-hmi.yml --target virtual/kernel 2>&1 | tee build-logs/virtual-kernel.log

echo "== core-image-minimal (log: build-logs/core-image-minimal.log) =="
kas build kas/elevator-hmi.yml 2>&1 | tee build-logs/core-image-minimal.log

echo "TASK-105 smoke sequence finished OK."
echo "Deploy artefacts (typical): build/tmp/deploy/images/elevator-hmi-em3566/"
