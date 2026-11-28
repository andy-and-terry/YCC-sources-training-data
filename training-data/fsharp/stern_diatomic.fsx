let stern count =
    let seq = Array.zeroCreate<int> (max count 2)
    seq.[1] <- 1
    for i in 2 .. count - 1 do
        seq.[i] <- if i % 2 = 0 then seq.[i / 2] else seq.[i / 2] + seq.[i / 2 + 1]
    Array.take count seq

printfn "%A" (stern 15) // [|0; 1; 1; 2; 1; 3; 2; 3; 1; 4; 3; 5; 2; 5; 3|]
