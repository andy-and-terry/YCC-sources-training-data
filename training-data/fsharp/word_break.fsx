let canSegment (s: string) (dictionary: Set<string>) =
    let dp = Array.create (s.Length + 1) false
    dp.[0] <- true

    for i in 1 .. s.Length do
        for j in 0 .. i - 1 do
            if dp.[j] && Set.contains (s.Substring(j, i - j)) dictionary then
                dp.[i] <- true

    dp.[s.Length]

let dict = Set.ofList [ "leet"; "code" ]
printfn "%b" (canSegment "leetcode" dict)
printfn "%b" (canSegment "leetcodex" dict)
