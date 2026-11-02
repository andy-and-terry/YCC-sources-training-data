#!/usr/bin/env bash
PS3="pick: "
select opt in start stop quit; do
  case $opt in
    start) echo "starting" ;;
    stop)  echo "stopping" ;;
    quit)  break ;;
    *)     echo "invalid" ;;
  esac
done
