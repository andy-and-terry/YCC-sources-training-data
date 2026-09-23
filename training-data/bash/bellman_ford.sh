#!/usr/bin/env bash
set -euo pipefail

# Edges as "from,to,weight" strings; Bellman-Ford relaxes every edge
# |V|-1 times and, unlike Dijkstra, tolerates negative edge weights.
edges=("0,1,4" "0,2,5" "1,2,-3" "2,3,4")
num_nodes=4
source_node=0

declare -a dist
for ((i = 0; i < num_nodes; i++)); do
    dist[i]=999999
done
dist[source_node]=0

for ((iter = 0; iter < num_nodes - 1; iter++)); do
    for edge in "${edges[@]}"; do
        IFS=',' read -r u v w <<< "$edge"
        if ((dist[u] != 999999 && dist[u] + w < dist[v])); then
            dist[v]=$((dist[u] + w))
        fi
    done
done

for ((i = 0; i < num_nodes; i++)); do
    echo "$i: ${dist[i]}"
done
