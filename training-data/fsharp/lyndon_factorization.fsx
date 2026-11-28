let duval (s: string) =
    let n = s.Length
    let out = ResizeArray<string>()
    let mutable i = 0
    while i < n do
        let mutable j = i + 1
        let mutable k = i
        while j < n && s.[k] <= s.[j] do
            k <- if s.[k] < s.[j] then i else k + 1
            j <- j + 1
        while i <= k do
            out.Add(s.Substring(i, j - k))
            i <- i + (j - k)
    List.ofSeq out

printfn "%A" (duval "banana")
