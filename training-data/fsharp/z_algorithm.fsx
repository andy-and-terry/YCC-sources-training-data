let zArray (s: string) =
    let n = s.Length
    let z = Array.create n 0
    let mutable l = 0
    let mutable r = 0
    for i in 1 .. n - 1 do
        if i < r then
            z.[i] <- min (r - i) z.[i - l]
        while i + z.[i] < n && s.[z.[i]] = s.[i + z.[i]] do
            z.[i] <- z.[i] + 1
        if i + z.[i] > r then
            l <- i
            r <- i + z.[i]
    z

let search (text: string) (pattern: string) =
    let combined = pattern + "$" + text
    let z = zArray combined
    let m = pattern.Length
    [ for i in 0 .. z.Length - 1 do
        if z.[i] = m then yield i - m - 1 ]

printfn "%A" (search "abxabcabcaby" "abc")
