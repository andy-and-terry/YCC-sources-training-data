#!/usr/bin/env bash
set -euo pipefail

# Deque on an associative array indexed by integers, with head/tail counters.
declare -A dq=()
head=0 tail=0 # head = index of first element, tail = one past last

push_back()  { dq[$tail]=$1; tail=$((tail + 1)); }
push_front() { head=$((head - 1)); dq[$head]=$1; }
size()       { echo $((tail - head)); }

pop_front() {
    ((tail > head)) || { echo "empty deque" >&2; return 1; }
    REPLY=${dq[$head]}; unset "dq[$head]"; head=$((head + 1))
}

pop_back() {
    ((tail > head)) || { echo "empty deque" >&2; return 1; }
    tail=$((tail - 1)); REPLY=${dq[$tail]}; unset "dq[$tail]"
}

show() { local i out=(); for ((i = head; i < tail; i++)); do out+=("${dq[$i]}"); done; echo "${out[*]}"; }

for x in 1 2 3 4 5; do push_back "$x"; done
push_front 0
push_front -1
show
pop_front; f=$REPLY
pop_back; b=$REPLY
echo "pop_front=$f pop_back=$b"
echo "$(show) size=$(size)"
pop_back; pop_back; pop_back; pop_back; pop_back
pop_back || echo "caught empty"
