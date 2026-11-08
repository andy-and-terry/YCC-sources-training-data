let crc8 (data: byte list) =
    let step crc b =
        let mutable c = crc ^^^ b
        for _ in 1 .. 8 do
            c <- if c &&& 0x80uy <> 0uy then (c <<< 1) ^^^ 0x07uy else c <<< 1
        c
    List.fold step 0uy data

printfn "%02x" (crc8 (List.ofSeq (System.Text.Encoding.ASCII.GetBytes "123456789")))
