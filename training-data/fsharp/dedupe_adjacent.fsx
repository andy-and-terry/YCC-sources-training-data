// Remove consecutive duplicates.
let dedupe xs = xs |> List.fold (fun acc x -> match acc with h :: _ when h = x -> acc | _ -> x :: acc) [] |> List.rev
printfn "%s" (System.String(dedupe (List.ofSeq "aabbbcdd") |> Array.ofList))
