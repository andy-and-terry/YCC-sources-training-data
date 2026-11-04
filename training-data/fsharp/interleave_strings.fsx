let interleave (parts: string list) =
    let longest = parts |> List.map String.length |> List.max
    [ for i in 0 .. longest - 1 do
        for p in parts do
            if i < p.Length then yield p.[i] ]
    |> List.toArray
    |> System.String

printfn "%s" (interleave [ "abc"; "12345" ])
printfn "%s" (interleave [ "ab"; "cd"; "efg" ])
