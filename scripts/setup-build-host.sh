#!/usr/bin/env bash
# Elevator HMI — Ubuntu LTS host packages for Yocto Scarthgap + kas.
# Tested: 22.04 LTS (Jammy), 24.04 LTS (Noble). Other Ubuntu releases: untested — extend ALLOWED_* if you verify.
# Idempotent: safe to run multiple times.
set -euo pipefail

# Yocto Scarthgap / kas work on both; TASK-002 originally validated 22.04 only.
ALLOWED_UBUNTU_VERSION_IDS=("22.04" "24.04")
SCRIPT_NAME="$(basename "$0")"

log() {
	printf '[%s] %s\n' "$SCRIPT_NAME" "$*" >&2
}

die() {
	log "ERROR: $*"
	exit 1
}

if [[ ! -r /etc/os-release ]]; then
	die "/etc/os-release not found — unsupported OS"
fi
# shellcheck source=/dev/null
source /etc/os-release
if [[ "${ID:-}" != "ubuntu" ]]; then
	die "This script supports Ubuntu only (found ID=${ID:-unknown})"
fi
allowed=0
for v in "${ALLOWED_UBUNTU_VERSION_IDS[@]}"; do
	if [[ "${VERSION_ID:-}" == "$v" ]]; then
		allowed=1
		break
	fi
done
if [[ "$allowed" -ne 1 ]]; then
	die "Ubuntu 22.04 or 24.04 LTS required (found VERSION_ID=${VERSION_ID:-unknown})"
fi

# EGL runtime for host tools (e.g. QEMU/SDL): Jammy ships libegl1-mesa; Noble dropped
# that metapackage — use GLVND libegl1 + Mesa vendor libegl-mesa0 instead.
PACKAGES=(
	build-essential
	chrpath
	debianutils
	diffstat
	gcc
	git
	iputils-ping
	kas
	liblz4-tool
	libsdl1.2-dev
	mesa-common-dev
	pylint
	python3
	python3-git
	python3-jinja2
	python3-pexpect
	python3-pip
	python3-subunit
	socat
	texinfo
	unzip
	xterm
	xz-utils
	zstd
)
case "${VERSION_ID}" in
22.04) PACKAGES+=(libegl1-mesa) ;;
24.04) PACKAGES+=(libegl1 libegl-mesa0) ;;
esac

export DEBIAN_FRONTEND=noninteractive
log "Ensure universe component (kas is packaged from universe on Ubuntu LTS)"
sudo apt-get install -y --no-install-recommends software-properties-common
sudo add-apt-repository -y universe || true
log "apt-get update"
sudo apt-get update -y
log "apt-get install packages (${#PACKAGES[@]} entries)"
sudo apt-get install -y --no-install-recommends "${PACKAGES[@]}"

log "Ensure pip can install/upgrade kas for latest fixes (optional if apt kas is enough)"
python3 -m pip install --user --upgrade 'kas>=4.0' || log "pip kas install skipped or failed — apt package may suffice"

USER_LOCAL_BIN="${HOME}/.local/bin"
case ":${PATH}:" in
*":${USER_LOCAL_BIN}:"*) ;;
*)
	log "Add ${USER_LOCAL_BIN} to PATH for pip-installed tools, e.g.:"
	log "  export PATH=\"${USER_LOCAL_BIN}:\$PATH\""
	;;
esac

if ! command -v kas >/dev/null 2>&1; then
	die "'kas' not found in PATH after install — add ${USER_LOCAL_BIN} to PATH and re-run"
fi
kas --version

CACHE_ROOT="${XDG_CACHE_HOME:-${HOME}/.cache}/elevator-hmi"
POKY_DIR="${CACHE_ROOT}/poky-yocto-5.0.16"
POKY_URL="https://git.yoctoproject.org/poky"
POKY_REF="yocto-5.0.16"

if [[ ! -f "${POKY_DIR}/oe-init-build-env" ]]; then
	log "Cloning shallow poky ${POKY_REF} into ${POKY_DIR} (for bitbake sanity check)"
	mkdir -p "${CACHE_ROOT}"
	rm -rf "${POKY_DIR}.tmp"
	git clone --depth 1 --branch "${POKY_REF}" "${POKY_URL}" "${POKY_DIR}.tmp"
	mv "${POKY_DIR}.tmp" "${POKY_DIR}"
fi

TMP_BUILD="$(mktemp -d "${TMPDIR:-/tmp}/elevator-hmi-bbcheck.XXXXXX")"
cleanup() {
	rm -rf "${TMP_BUILD}"
}
trap cleanup EXIT

# shellcheck disable=SC1090
# oe-init-build-env expects to be sourced from a shell; it cd's into the build dir.
set +u
# shellcheck disable=SC1091
source "${POKY_DIR}/oe-init-build-env" "${TMP_BUILD}"
set -u
bitbake --version

log "Host setup complete: kas and bitbake are usable."
