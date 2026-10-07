#!/usr/bin/env bash
# Returning values from functions: via stdout, via global var, and via exit status.
square_stdout() { echo $(($1 * $1)); }
square_global() { RESULT=$(($1 * $1)); }
is_even() { (($1 % 2 == 0)); }

echo "stdout: $(square_stdout 6)"
square_global 7
echo "global: $RESULT"
for n in 3 4; do
    if is_even "$n"; then echo "$n even"; else echo "$n odd"; fi
done
