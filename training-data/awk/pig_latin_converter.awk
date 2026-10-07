#!/usr/bin/awk -f
# Converts each word on stdin to pig latin: consonant-start words move
# their leading consonant cluster to the end and add "ay"; vowel-start
# words just add "way".
function pig_latin(word,    i, ch) {
    if (word ~ /^[aeiouAEIOU]/) {
        return word "way"
    }
    for (i = 1; i <= length(word); i++) {
        ch = substr(word, i, 1)
        if (ch ~ /[aeiouAEIOU]/) {
            return substr(word, i) substr(word, 1, i - 1) "ay"
        }
    }
    return word "ay"
}
{
    for (i = 1; i <= NF; i++) {
        printf "%s ", pig_latin($i)
    }
    print ""
}
