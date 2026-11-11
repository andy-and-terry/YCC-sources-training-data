# Bulls and Cows scoring for equal-length digit strings.
function score(secret, guess,    i, s, g, c, bulls, cows) {
    split("", sc); split("", gc)
    for (i = 1; i <= length(secret); i++) {
        s = substr(secret, i, 1); g = substr(guess, i, 1)
        if (s == g) bulls++
        else { sc[s]++; gc[g]++ }
    }
    for (c in sc) cows += (sc[c] < gc[c] ? sc[c] : gc[c])
    return bulls " bull(s), " cows+0 " cow(s)"
}

BEGIN { print score("1807", "7810") }
