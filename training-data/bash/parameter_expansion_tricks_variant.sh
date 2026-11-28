#!/usr/bin/env bash
path="/var/log/app/server.log.gz"
echo "${path##*/}"
echo "${path%.*}"
echo "${path%%.*}"
echo "${path/log/LOG}"
name=""
echo "${name:-default}"
echo "${path:5:3}"
