#!/usr/bin/env bash
set -euo pipefail

data='name:age:city
ann:30:paris
bob:25:rome
cy:41:oslo'

echo "$data" | cut -d: -f1,3
echo "---"

# Skip the header, upper-case the names, sort by age descending
echo "$data" | tail -n +2 | sort -t: -k2,2nr | cut -d: -f1 | tr '[:lower:]' '[:upper:]'
echo "---"

# Replace delimiters and squeeze repeated characters
echo "a,,b,,,c" | tr -s ',' ';'
echo "hello world" | tr -d 'aeiou'
echo "a b  c" | tr -s ' ' | tr ' ' '_'
echo "---"

# Word frequency pipeline
text="the cat and the dog and the bird"
echo "$text" | tr ' ' '\n' | sort | uniq -c | sort -rn | head -n 3
echo "---"

# Average age with paste/bc-free arithmetic
total=0 n=0
while IFS=: read -r _ age _; do
    total=$((total + age)); n=$((n + 1))
done < <(echo "$data" | tail -n +2)
echo "average age: $((total / n))"
