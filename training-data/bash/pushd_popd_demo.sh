#!/usr/bin/env bash
set -euo pipefail

base=$(mktemp -d)
trap 'rm -rf "$base"' EXIT
mkdir -p "$base/a/b" "$base/c"

pushd "$base/a" > /dev/null
echo "in: ${PWD#"$base"}"

pushd b > /dev/null
echo "in: ${PWD#"$base"}"

echo "stack depth: ${#DIRSTACK[@]}"

pushd "$base/c" > /dev/null
echo "in: ${PWD#"$base"}"

popd > /dev/null
echo "back to: ${PWD#"$base"}"

popd > /dev/null
echo "back to: ${PWD#"$base"}"

popd > /dev/null
echo "restored original directory: $([[ $PWD != "$base"* ]] && echo yes || echo no)"

# Subshell alternative: no need to restore
( cd "$base/c" && echo "temporary cd: ${PWD#"$base"}" )
