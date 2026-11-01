#!/usr/bin/env bash
PS3="pick: "
select opt in start stop quit; do
  case $opt in
    start) echo starting ;;
    stop) echo stopping ;;
    quit) break ;;
    *) echo "invalid: $REPLY" ;;
  esac
done < <(printf '1\n2\n3\n')
