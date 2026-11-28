let chebyshev (a: int list) (b: int list) =
    List.map2 (fun x y -> abs (x - y)) a b |> List.max

printfn "%d" (chebyshev [1; 2] [4; 6])
