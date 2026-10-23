#!/usr/bin/env bash
kaprekar_steps() {
  local n=$1 steps=0 s asc desc
  while ((n != 6174)); do
    s=$(printf '%04d' "$n" | grep -o . | sort | tr -d '\n')
    asc=$((10#$s))
    desc=$((10#$(echo "$s" | rev)))
    n=$((desc - asc))
    ((steps++))
  done
  echo "$steps"
}

kaprekar_steps 3524
