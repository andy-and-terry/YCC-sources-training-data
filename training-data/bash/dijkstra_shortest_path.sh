#!/usr/bin/env bash
set -euo pipefail

declare -A graph
graph["A,B"]=4
graph["A,C"]=1
graph["C,B"]=2
graph["B,D"]=1
graph["C,D"]=5

nodes=(A B C D)
declare -A dist
declare -A visited

for n in "${nodes[@]}"; do
    dist[$n]=999999
done
dist[A]=0

for _ in "${nodes[@]}"; do
    current=""
    best=999999
    for n in "${nodes[@]}"; do
        if [[ -z "${visited[$n]:-}" ]] && ((dist[$n] < best)); then
            best=${dist[$n]}
            current=$n
        fi
    done
    [[ -z "$current" ]] && break
    visited[$current]=1
    for n in "${nodes[@]}"; do
        key="$current,$n"
        if [[ -n "${graph[$key]:-}" ]]; then
            new_dist=$((dist[$current] + graph[$key]))
            if ((new_dist < dist[$n])); then
                dist[$n]=$new_dist
            fi
        fi
    done
done

for n in "${nodes[@]}"; do
    echo "$n: ${dist[$n]}"
done
