let rabinKarp (text: string) (pattern: string) =
    let base_ = 256
    let modulus = 101
    let m, n = pattern.Length, text.Length
    let mutable patternHash = 0
    let mutable windowHash = 0
    let mutable h = 1
    for _ in 1 .. m - 1 do
        h <- (h * base_) % modulus
    for i in 0 .. m - 1 do
        patternHash <- (base_ * patternHash + int pattern.[i]) % modulus
        windowHash <- (base_ * windowHash + int text.[i]) % modulus
    [ for i in 0 .. n - m do
          if i > 0 then
              windowHash <- (base_ * (windowHash - int text.[i - 1] * h) + int text.[i + m - 1]) % modulus
              if windowHash < 0 then
                  windowHash <- windowHash + modulus
          if windowHash = patternHash && text.Substring(i, m) = pattern then
              yield i ]

printfn "%A" (rabinKarp "abxabcabcaby" "abcaby")
