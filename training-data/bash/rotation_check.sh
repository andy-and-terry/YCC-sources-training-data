#!/usr/bin/env bash
set -euo pipefail

is_rotation() {
  [[ ${#1} -eq ${#2} && "$1$1" == *"$2"* ]]
}

is_rotation waterbottle erbottlewat && echo yes || echo no
is_rotation abc acb && echo yes || echo no
