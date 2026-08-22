#!/usr/bin/env bash
set -euo pipefail

s="Hello, World!"
echo "${s^^}"
echo "${s,,}"
echo "${#s}"
echo "${s/World/Bash}"
echo "${s:7:5}"
