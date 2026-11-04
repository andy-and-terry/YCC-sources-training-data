let ugly n =
    let seq = ResizeArray [ 1L ]
    let mutable i2, i3, i5 = 0, 0, 0
    while seq.Count < n do
        let c2, c3, c5 = seq.[i2] * 2L, seq.[i3] * 3L, seq.[i5] * 5L
        let next = min c2 (min c3 c5)
        seq.Add next
        if next = c2 then i2 <- i2 + 1
        if next = c3 then i3 <- i3 + 1
        if next = c5 then i5 <- i5 + 1
    seq.[n - 1]

printfn "%A" [ for i in 1..12 -> ugly i ]
