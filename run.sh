#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_BIN="$ROOT_DIR/.build/bin/MyFirstMacApp"

if [ ! -x "$OUTPUT_BIN" ]; then
  "$ROOT_DIR/build.sh"
fi

exec "$OUTPUT_BIN"
