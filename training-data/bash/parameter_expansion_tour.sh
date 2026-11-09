#!/usr/bin/env bash
path="/home/user/report.final.txt"
echo "${path##*/}"      # basename
echo "${path%/*}"       # dirname
echo "${path%.*}"       # strip last extension
echo "${path##*.}"      # extension
echo "${path/user/admin}"
echo "${#path}"
echo "${unset_var:-default}"
