#!/usr/bin/env bash
set -euo pipefail

cleanup() {
    echo "cleaning up"
}

trap cleanup EXIT

echo "doing work"
echo "done"
