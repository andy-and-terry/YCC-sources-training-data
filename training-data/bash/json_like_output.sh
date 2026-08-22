#!/usr/bin/env bash
set -euo pipefail

name="Ada"
age=30

printf '{"name": "%s", "age": %d}\n' "$name" "$age"
