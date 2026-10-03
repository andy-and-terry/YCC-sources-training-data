#!/usr/bin/env bash
set -euo pipefail

name="Hello World"
echo "Upper:      ${name^^}"
echo "Lower:      ${name,,}"
echo "First-cap:  ${name^}"
echo "First-low:  ${name,}"
