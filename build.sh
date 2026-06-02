#!/usr/bin/env bash
# Compiles cv.tex to assets/resources/cv.pdf using a Docker-based TeX Live environment.
# Runs in a temp directory so all build artifacts stay user-owned and never pollute the repo.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$(mktemp -d)"
OUTPUT="$SCRIPT_DIR/assets/resources/cv.pdf"

cleanup() { rm -rf "$BUILD_DIR"; }
trap cleanup EXIT

cp "$SCRIPT_DIR/cv.tex" "$BUILD_DIR/cv.tex"

docker run --rm \
  -u "$(id -u):$(id -g)" \
  -v "$BUILD_DIR":/data \
  -w /data \
  texlive/texlive:latest \
  pdflatex -interaction=nonstopmode cv.tex

cp "$BUILD_DIR/cv.pdf" "$OUTPUT"
echo "Generated: $OUTPUT"
