#!/usr/bin/env bash
swap_case() {
  echo "$1" | tr 'a-zA-Z' 'A-Za-z'
}

swap_case "Hello World 42"
