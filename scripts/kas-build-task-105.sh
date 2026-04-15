#!/usr/bin/env bash
# TASK-105: run kas smoke builds and save logs under build-logs/ (gitignored).
# Prereq: Ubuntu 22.04 or 24.04 LTS + ./scripts/setup-build-host.sh (lz4c and other HOSTTOOLS).
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"
mkdir -p build-logs

echo "== u-boot-rockchip (log: build-logs/u-boot-rockchip.log) =="
# Rockchip machines set PREFERRED_PROVIDER_virtual/bootloader = u-boot-rockchip; `u-boot` is not buildable.
kas build kas/elevator-hmi.yml --target u-boot-rockchip 2>&1 | tee build-logs/u-boot-rockchip.log

echo "== virtual/kernel (log: build-logs/virtual-kernel.log) =="
kas build kas/elevator-hmi.yml --target virtual/kernel 2>&1 | tee build-logs/virtual-kernel.log

echo "== core-image-minimal (log: build-logs/core-image-minimal.log) =="
kas build kas/elevator-hmi.yml 2>&1 | tee build-logs/core-image-minimal.log

echo "TASK-105 smoke sequence finished OK."
echo "Deploy artefacts (typical): build/tmp/deploy/images/elevator-hmi-em3566/"
