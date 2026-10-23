#!/usr/bin/env bash
# compgen lists builtins, keywords, variables and completions without a TTY

echo "Builtins starting with 'ca':"
compgen -b -- ca

echo "Keywords starting with 'wh':"
compgen -k -- wh

MY_APP_HOME=/opt/app
MY_APP_MODE=dev
echo "Variables starting with MY_APP_:"
compgen -v -- MY_APP_

# Filter a custom word list by prefix
words="deploy describe destroy build"
echo "Words matching 'de':"
compgen -W "$words" -- de

# Existence check for a command in any form
if compgen -c -- ls | grep -qx ls; then
  echo "ls is available"
fi
