#!/usr/bin/env bash
set -euo pipefail

counter=10

shadow() {
    local counter=1
    counter=$((counter + 1))
    echo "inside shadow: $counter"
}

leak() {
    counter=$((counter + 5))     # modifies the global
    new_global="created in function"
}

# Dynamic scoping: callee sees the caller's local variables
outer() {
    local name="outer"
    inner
}
inner() {
    echo "inner sees name=$name"
}

shadow
echo "after shadow: $counter"
leak
echo "after leak: $counter, $new_global"
outer

# Returning values: status via return, data via stdout
add() {
    local sum=$(( $1 + $2 ))
    echo "$sum"
}
result=$(add 4 5)
echo "add result: $result"
