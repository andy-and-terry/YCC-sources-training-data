let s = "functional"

printfn "%s" s.[0..3]
printfn "%s" s.[4..]
printfn "%s" s.[..2]
printfn "%c" s.[s.Length - 1]
printfn "%s" (s.Substring(2, 4))
printfn "%s" (System.String(Array.rev (s.ToCharArray())))
printfn "%s" (s |> Seq.rev |> Seq.toArray |> System.String)
printfn "%b" (s.StartsWith "func")
printfn "%d" (s.IndexOf "ion")
printfn "%s" (s.Replace("al", "AL"))
printfn "%A" (s |> Seq.filter (fun c -> "aeiou".Contains c) |> Seq.length)
