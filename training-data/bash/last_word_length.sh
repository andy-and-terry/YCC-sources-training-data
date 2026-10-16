#!/usr/bin/env bash
# Length of the last word in a sentence.
s="  fly me   to the moon  "
read -ra words <<< "$s"
last=${words[-1]}
echo "last word: '$last' length ${#last}"
