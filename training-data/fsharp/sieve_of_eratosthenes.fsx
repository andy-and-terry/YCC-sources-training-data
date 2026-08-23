let sieve limit =
    let flags = Array.create (limit + 1) true
    flags.[0] <- false
    if limit >= 1 then flags.[1] <- false
    for i in 2 .. int (sqrt (float limit)) do
        if flags.[i] then
            for j in i * i .. i .. limit do
                flags.[j] <- false
    [ for i in 2 .. limit do if flags.[i] then yield i ]

printfn "%A" (sieve 50)
