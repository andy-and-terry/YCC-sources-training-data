#!/usr/bin/env bash
set -euo pipefail

diff <(echo -e "a\nb\nc") <(echo -e "a\nb\nd") || true
