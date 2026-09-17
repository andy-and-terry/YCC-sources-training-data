let wordBreak (s: string) (wordDict: Set<string>) =
    let n = s.Length
    let dp = Array.create (n + 1) false
    dp.[0] <- true

    for i in 1 .. n do
        for j in 0 .. i - 1 do
            if dp.[j] && wordDict.Contains(s.Substring(j, i - j)) then
                dp.[i] <- true

    dp.[n]

let dict = Set.ofList [ "leet"; "code"; "apple"; "pen" ]
printfn "%b" (wordBreak "leetcode" dict)
printfn "%b" (wordBreak "applepenapple" dict)
printfn "%b" (wordBreak "catsandog" dict)
