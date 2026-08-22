#!/usr/bin/env bash
set -euo pipefail

src_dir="${1:?usage: backup.sh <source-dir> <dest-dir>}"
dest_dir="${2:?usage: backup.sh <source-dir> <dest-dir>}"

timestamp="$(date +%Y%m%d_%H%M%S)"
archive_name="backup_${timestamp}.tar.gz"

mkdir -p "$dest_dir"
tar -czf "${dest_dir}/${archive_name}" -C "$(dirname "$src_dir")" "$(basename "$src_dir")"

echo "Created ${dest_dir}/${archive_name}"
