#!/usr/bin/env bash
# declare -n creates a name reference, letting functions modify caller variables

append_item() {
  local -n target=$1      # target now aliases the variable named by $1
  shift
  target+=("$@")
}

double_all() {
  local -n arr=$1
  local i
  for i in "${!arr[@]}"; do
    arr[i]=$(( arr[i] * 2 ))
  done
}

nums=(1 2 3)
append_item nums 4 5
double_all nums
echo "nums: ${nums[*]}"

# Alias a scalar and change it through the reference
declare -n ref=greeting
greeting="hello"
ref="goodbye"
echo "greeting: $greeting"

# Select one of several arrays by name
fruits=(apple pear)
veggies=(kale leek)
for group in fruits veggies; do
  declare -n current=$group
  echo "$group has ${#current[@]} items: ${current[*]}"
  unset -n current
done
