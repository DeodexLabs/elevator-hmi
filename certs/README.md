# RAUC signing keys (local / CI only)

- **Development:** from the repository root run **`./scripts/rauc-gen-keys.sh`**. Outputs land under **`certs/`** and are **not** tracked in Git (see root **`.gitignore`**).
- **Production:** keys and CA material **must never** be committed. Generate offline, protect with HSM or a secrets vault, and inject only at bundle-signing time. Bundle signing procedure for this product is **TBD Phase 2** (see **`AGENTS.md`** / RAUC tasks).
