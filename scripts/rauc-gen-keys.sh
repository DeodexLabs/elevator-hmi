#!/usr/bin/env bash
#
# WARNING: Development keys only. Never commit certs/. Production keys must be
# generated offline and stored in HSM or secrets vault.
#
# Generates a self-signed development CA and a RAUC bundle signing key + cert
# under ./certs/ (see .gitignore: *.pem, *.key, certs/private/).
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CERTDIR="${ROOT}/certs"
TMPDIR="$(mktemp -d)"
cleanup() {
	rm -rf "${TMPDIR}"
}
trap cleanup EXIT

mkdir -p "${CERTDIR}/private"
cd "${TMPDIR}"

openssl req -x509 -newkey rsa:4096 -nodes \
	-keyout ca.key.pem -out ca.cert.pem -days 3650 \
	-subj "/O=elevator-hmi-dev/CN=elevator-hmi-RAUC-CA"

openssl req -newkey rsa:4096 -nodes \
	-keyout development-1.key.pem -out req.pem \
	-subj "/O=elevator-hmi-dev/CN=elevator-hmi-development-1"

openssl x509 -req -in req.pem \
	-CA ca.cert.pem -CAkey ca.key.pem -CAcreateserial \
	-out development-1.cert.pem -days 3650

install -m 0644 ca.cert.pem "${CERTDIR}/ca.cert.pem"
install -m 0644 development-1.cert.pem "${CERTDIR}/development-1.cert.pem"
install -m 0600 ca.key.pem "${CERTDIR}/private/ca.key.pem"
install -m 0600 development-1.key.pem "${CERTDIR}/private/development-1.key.pem"

echo "Generated development-only RAUC keys under ${CERTDIR}/"
echo "  (public) ca.cert.pem, development-1.cert.pem"
echo "  (private) private/ca.key.pem, private/development-1.key.pem"
