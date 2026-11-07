let fourSumCount a b c d =
    let sums =
        [ for x in a do for y in b -> x + y ]
        |> List.countBy id
        |> Map.ofList
    [ for x in c do for y in d -> Map.tryFind (-(x + y)) sums |> Option.defaultValue 0 ]
    |> List.sum

printfn "%d" (fourSumCount [ 1; 2 ] [ -2; -1 ] [ -1; 2 ] [ 0; 2 ]) // 2
