let result =
    seq { 1 .. 20 }
    |> Seq.filter (fun n -> n % 3 = 0)
    |> Seq.map (fun n -> n * n)
    |> Seq.toList

printfn "%A" result
printfn "%d" (List.sum result)
printfn "%A" (List.zip [ 1; 2; 3 ] [ "a"; "b"; "c" ])
