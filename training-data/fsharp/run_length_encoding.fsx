let encode (s: string) =
    s
    |> Seq.toList
    |> List.fold
        (fun acc c ->
            match acc with
            | (ch, count) :: rest when ch = c -> (ch, count + 1) :: rest
            | _ -> (c, 1) :: acc)
        []
    |> List.rev
    |> List.map (fun (c, n) -> sprintf "%c%d" c n)
    |> String.concat ""

let decode (s: string) =
    System.Text.RegularExpressions.Regex.Matches(s, @"([A-Za-z])(\d+)")
    |> Seq.cast<System.Text.RegularExpressions.Match>
    |> Seq.map (fun m -> String.replicate (int m.Groups.[2].Value) m.Groups.[1].Value)
    |> String.concat ""

let encoded = encode "aaabbbcccd"
printfn "%s" encoded
printfn "%s" (decode encoded)
