let rec varint n =
    if n < 128 then [ n ]
    else ((n &&& 127) ||| 128) :: varint (n >>> 7)

varint 300 |> List.iter (printf "%02x ")
printfn ""
