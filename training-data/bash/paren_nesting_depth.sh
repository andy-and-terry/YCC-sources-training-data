#!/usr/bin/env bash
# Maximum nesting depth of parentheses; -1 if the string is unbalanced.
max_depth() {
  local s=$1 depth=0 best=0 i ch
  for ((i = 0; i < ${#s}; i++)); do
    ch=${s:i:1}
    if [[ $ch == "(" ]]; then
      depth=$((depth + 1))
      (( depth > best )) && best=$depth
    elif [[ $ch == ")" ]]; then
      depth=$((depth - 1))
      (( depth < 0 )) && { echo -1; return; }
    fi
  done
  (( depth == 0 )) && echo "$best" || echo -1
}

echo "$(max_depth '(1+(2*(3)))') $(max_depth '(()')"
