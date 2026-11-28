let bwt (s: string) =
    [ for i in 0 .. s.Length - 1 -> s.Substring i + s.Substring(0, i) ]
    |> List.sortWith (fun a b -> System.String.CompareOrdinal(a, b))
    |> List.map (fun r -> r.[r.Length - 1])
    |> System.String.Concat

printfn "%s" (bwt "banana$")
