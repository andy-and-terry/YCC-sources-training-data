# Bulls and Cows scoring for equal-length digit strings.
import std/tables

proc score(secret, guess: string): (int, int) =
  var bulls = 0
  var sc, gc = initCountTable[char]()
  for i in 0 ..< secret.len:
    if secret[i] == guess[i]:
      inc bulls
    else:
      sc.inc secret[i]
      gc.inc guess[i]
  var cows = 0
  for c, n in sc:
    cows += min(n, gc.getOrDefault(c, 0))
  (bulls, cows)

let (b, c) = score("1807", "7810")
echo b, " bull(s), ", c, " cow(s)"
