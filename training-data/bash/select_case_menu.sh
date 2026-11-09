#!/usr/bin/env bash
for opt in start stop other; do
    case "$opt" in
        start|run) echo "$opt -> starting" ;;
        stop)      echo "$opt -> stopping" ;;
        *)         echo "$opt -> unknown" ;;
    esac
done
