#!/usr/bin/env bash
set -euo pipefail

# Edge list: "from,to"=weight, allows negative weights unlike Dijkstra.
declare -A edges
edges["A,B"]=4
edges["A,C"]=5
edges["B,C"]=-3
edges["C,D"]=4
edges["B,D"]=6

nodes=(A B C D)
declare -A dist
for n in "${nodes[@]}"; do
    dist[$n]=999999
done
dist[A]=0

for ((i = 1; i < ${#nodes[@]}; i++)); do
    for key in "${!edges[@]}"; do
        from=${key%,*}
        to=${key#*,}
        w=${edges[$key]}
        if ((dist[$from] != 999999 && dist[$from] + w < dist[$to])); then
            dist[$to]=$((dist[$from] + w))
        fi
    done
done

for n in "${nodes[@]}"; do
    echo "$n: ${dist[$n]}"
done
