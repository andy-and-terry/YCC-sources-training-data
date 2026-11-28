let addBinary (a: string) (b: string) =
    let n = max a.Length b.Length
    let xs = a.PadLeft(n, '0') |> Seq.rev |> Seq.map (fun c -> int c - int '0') |> List.ofSeq
    let ys = b.PadLeft(n, '0') |> Seq.rev |> Seq.map (fun c -> int c - int '0') |> List.ofSeq
    let carry, bits =
        List.zip xs ys
        |> List.fold (fun (c, acc) (x, y) -> let s = x + y + c in (s / 2, string (s % 2) :: acc)) (0, [])
    String.concat "" (if carry > 0 then "1" :: bits else bits)

printfn "%s" (addBinary "1010" "1011") // 10101
