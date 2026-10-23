#!/usr/bin/env bash
set -euo pipefail

# Shell functions are not inherited by child processes unless exported with
# `export -f`. This matters for bash -c, xargs and find -exec.
greet() {
  echo "hello, $1"
}

square() {
  echo $(( $1 * $1 ))
}

# Without export, the child bash cannot see the function.
if bash -c 'greet world' 2>/dev/null; then
  echo "unexpected: function visible"
else
  echo "not exported: child cannot call greet"
fi

export -f greet square

bash -c 'greet world'

# Common use: run an exported function in parallel over arguments.
printf '%s\n' 1 2 3 4 | xargs -I{} -P2 bash -c 'square {}' | sort -n

# Show which functions are exported, then remove the export attribute.
declare -F greet square
export -nf greet
bash -c 'greet again' 2>/dev/null || echo "greet no longer exported"
