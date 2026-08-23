let buildLps (pattern: string) =
    let n = pattern.Length
    let lps = Array.create n 0
    let mutable len = 0
    let mutable i = 1
    while i < n do
        if pattern.[i] = pattern.[len] then
            len <- len + 1
            lps.[i] <- len
            i <- i + 1
        elif len <> 0 then
            len <- lps.[len - 1]
        else
            lps.[i] <- 0
            i <- i + 1
    lps

let kmpSearch (text: string) (pattern: string) =
    let lps = buildLps pattern
    let n = text.Length
    let m = pattern.Length
    let mutable i = 0
    let mutable j = 0
    let mutable result = -1
    while i < n && result = -1 do
        if text.[i] = pattern.[j] then
            i <- i + 1
            j <- j + 1
            if j = m then result <- i - j
        elif j > 0 then
            j <- lps.[j - 1]
        else
            i <- i + 1
    result

printfn "%d" (kmpSearch "abxabcabcaby" "abcaby")
