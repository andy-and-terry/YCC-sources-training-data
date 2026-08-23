let binaryToDecimal (s: string) =
    s |> Seq.fold (fun acc c -> acc * 2 + int c - int '0') 0

printfn "%d" (binaryToDecimal "1011")
