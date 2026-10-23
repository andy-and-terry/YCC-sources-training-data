#!/usr/bin/env bash
# read options: -n (count), -d (delimiter), -t (timeout), -r (raw)

# Read exactly 3 characters
read -r -n 3 prefix <<< "hello world"
echo "first 3 chars: [$prefix]"

# Read up to a custom delimiter instead of newline
read -r -d ';' field <<< "alpha;beta;gamma"
echo "up to semicolon: [$field]"

# Split into an array with -a
IFS=, read -r -a parts <<< "red,green,blue"
echo "parts: ${#parts[@]} -> ${parts[*]}"

# Timeout: nothing writes to this pipe, so read gives up after 0.2s
if read -r -t 0.2 line < <(sleep 1); then
    echo "got: $line"
else
    status=$?
    echo "timed out (status $status > 128: $((status > 128)))"
fi

# Read NUL-delimited records safely (e.g. from find -print0)
while IFS= read -r -d '' item; do
    echo "record: [$item]"
done < <(printf 'one two\0three\0')
