let isToeplitz (m: int list list) =
    m
    |> List.pairwise
    |> List.forall (fun (prev, cur) -> List.tail cur = List.truncate (cur.Length - 1) prev)

printfn "%b" (isToeplitz [ [ 1; 2; 3 ]; [ 4; 1; 2 ]; [ 5; 4; 1 ] ])
printfn "%b" (isToeplitz [ [ 1; 2 ]; [ 2; 2 ] ])
