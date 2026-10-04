#!/usr/bin/env bash
# Pattern removal and replacement with parameter expansion.
path="/home/user/docs/report.final.txt"
echo "${path##*/}"       # basename
echo "${path%/*}"        # dirname
echo "${path%.*}"        # strip last extension
echo "${path%%.*}"       # strip all extensions
echo "${path/docs/files}"
echo "${path//o/0}"
echo "${path:6:4}"
echo "${#path}"
