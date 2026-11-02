BEGIN { printf "%-10s %8s\n", "name", "score"; print "----------------    " }
{ printf "%-10s %8.2f\n", $1, $2; sum += $2 }
END { printf "%-10s %8.2f\n", "avg", NR ? sum / NR : 0 }
