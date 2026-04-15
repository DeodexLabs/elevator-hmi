# Scripts

## `setup-build-host.sh`

Prepares an **Ubuntu 22.04 LTS** machine for Yocto Scarthgap builds (kas, BitBake host dependencies, lz4, SDL for QEMU menus, and related tools).

Requirements:

- sudo for `apt-get`
- Run on Ubuntu **22.04** only (the script exits with an error on other releases).

Usage:

```bash
./scripts/setup-build-host.sh
```

Afterwards:

- Ensure `~/.local/bin` is on your `PATH` if you rely on `pip install --user kas`.
- `kas --version` should print the installed version.
- `bitbake --version` is verified using a **cached shallow** `poky` checkout at `yocto-5.0.16` under `${XDG_CACHE_HOME:-$HOME/.cache}/elevator-hmi/poky-yocto-5.0.16` (first run downloads it).

Project images are built via kas from the repository root — see the root `README.md`.

## `convert-library.sh`

Vendor PDF → Markdown conversion helper (see script header for usage).
