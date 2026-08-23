let normalize (s: string) =
    s.ToLower()
    |> Seq.filter (fun c -> c <> ' ')
    |> Seq.sort
    |> Array.ofSeq

let isAnagram a b = normalize a = normalize b

printfn "%b" (isAnagram "listen" "silent")
printfn "%b" (isAnagram "hello" "world")
