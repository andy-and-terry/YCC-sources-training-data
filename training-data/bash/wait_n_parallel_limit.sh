#!/usr/bin/env bash
# Run jobs with a concurrency limit using wait -n
max_jobs=3
work() { sleep 0.$((RANDOM % 5)); echo "job $1 done"; }

for i in {1..8}; do
  while (( $(jobs -rp | wc -l) >= max_jobs )); do
    wait -n
  done
  work "$i" &
done
wait
echo "all finished"
