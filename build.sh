#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$ROOT_DIR/.build"
MODULE_CACHE_DIR="$BUILD_DIR/module-cache"
BIN_DIR="$BUILD_DIR/bin"
OUTPUT_BIN="$BIN_DIR/MyFirstMacApp"

mkdir -p "$MODULE_CACHE_DIR" "$BIN_DIR"

if [ -d /Applications/Xcode.app ]; then
  export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
fi

xcrun swiftc \
  "$ROOT_DIR/main.swift" \
  -framework AppKit \
  -module-cache-path "$MODULE_CACHE_DIR" \
  -o "$OUTPUT_BIN"

echo "Built: $OUTPUT_BIN"
