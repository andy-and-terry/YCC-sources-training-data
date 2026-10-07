#!/usr/bin/env bash
set -euo pipefail

declare -A weight
weight["A,B"]=2; weight["B,A"]=2
weight["A,C"]=3; weight["C,A"]=3
weight["B,C"]=1; weight["C,B"]=1
weight["B,D"]=4; weight["D,B"]=4
weight["C,D"]=5; weight["D,C"]=5

nodes=(A B C D)
declare -A in_mst
declare -A key
for n in "${nodes[@]}"; do
    key[$n]=999999
done
key[A]=0

total=0
for _ in "${nodes[@]}"; do
    current=""
    best=999999
    for n in "${nodes[@]}"; do
        if [[ -z "${in_mst[$n]:-}" ]] && ((key[$n] < best)); then
            best=${key[$n]}
            current=$n
        fi
    done
    [[ -z "$current" ]] && break
    in_mst[$current]=1
    total=$((total + best))
    echo "Add $current (edge weight $best)"

    for n in "${nodes[@]}"; do
        w=${weight["$current,$n"]:-}
        if [[ -n "$w" && -z "${in_mst[$n]:-}" ]] && ((w < key[$n])); then
            key[$n]=$w
        fi
    done
done
echo "Total MST weight: $total"
