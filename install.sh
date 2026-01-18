#!/usr/bin/env sh
set -eu

REPO="slyang-git/x-go-releases"
INSTALL_DIR="/usr/local/bin"
BIN_NAME="xcli"

os="$(uname -s 2>/dev/null || true)"
arch="$(uname -m 2>/dev/null || true)"

case "$os" in
  Linux) os="linux" ;;
  Darwin) os="darwin" ;;
  *)
    echo "Unsupported OS: $os" >&2
    exit 1
    ;;
esac

case "$arch" in
  x86_64|amd64) arch="amd64" ;;
  arm64|aarch64) arch="arm64" ;;
  *)
    echo "Unsupported arch: $arch" >&2
    exit 1
    ;;
esac

asset="${BIN_NAME}-${os}-${arch}"
if [ "$os" = "windows" ]; then
  asset="${asset}.exe"
fi

url="https://github.com/${REPO}/releases/latest/download/${asset}"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

if command -v curl >/dev/null 2>&1; then
  curl -fsSL -o "$tmpdir/$BIN_NAME" "$url"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$tmpdir/$BIN_NAME" "$url"
else
  echo "Missing curl or wget" >&2
  exit 1
fi

if [ ! -w "$INSTALL_DIR" ]; then
  sudo install -m 755 "$tmpdir/$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
else
  install -m 755 "$tmpdir/$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"
fi

echo "Installed ${BIN_NAME} to ${INSTALL_DIR}/${BIN_NAME}"
