let result =
    [ 1 .. 10 ]
    |> List.filter (fun x -> x % 2 = 0)
    |> List.map (fun x -> x * x)
    |> List.sum

printfn "%d" result
