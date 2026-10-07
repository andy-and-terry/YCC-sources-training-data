#!/usr/bin/env bash
set -euo pipefail

# printf %(fmt)T formats epoch seconds without forking date (bash 4.2+).
TZ=UTC printf 'epoch zero: %(%Y-%m-%d %H:%M:%S)T\n' 0
TZ=UTC printf 'one day later: %(%A)T\n' 86400
