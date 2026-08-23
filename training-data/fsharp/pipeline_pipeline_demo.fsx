let result =
    [ 1 .. 20 ]
    |> List.filter (fun n -> n % 2 = 0)
    |> List.map (fun n -> n * n)
    |> List.sum

printfn "%d" result
