#!/usr/bin/env bash
set -euo pipefail

EXPECTED_FILE="tests/expected.txt"

OUT="$(qemu-aarch64 -L /usr/aarch64-linux-gnu ./prog)"
EXP="$(cat "$EXPECTED_FILE")"

echo "Salida real:"
echo "$OUT"
echo
echo "Salida esperada:"
echo "$EXP"
echo

if [ "$OUT" = "$EXP" ]; then
  echo "OK: salida coincide"
  exit 0
else
  echo "FAIL: salida no coincide"
  exit 1
fi
