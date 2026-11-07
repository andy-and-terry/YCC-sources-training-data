#!/usr/bin/env bash
rows=("2" "3 4" "6 5 7" "4 1 8 3")
read -ra dp <<< "${rows[-1]}"
for (( r = ${#rows[@]} - 2; r >= 0; r-- )); do
  read -ra row <<< "${rows[r]}"
  for i in "${!row[@]}"; do
    m=$(( dp[i] < dp[i+1] ? dp[i] : dp[i+1] ))
    dp[i]=$(( row[i] + m ))
  done
done
echo "${dp[0]}" # 11
