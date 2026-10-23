#!/usr/bin/env bash
unset name
echo "${name:-fallback}"       # use default, don't assign
echo "${name:=assigned}"       # assign default
echo "name is now: $name"
echo "${name:+alt value}"      # alt value when set
unset missing
( echo "${missing:?variable missing}" ) 2>&1 | sed 's/^/error: /'
