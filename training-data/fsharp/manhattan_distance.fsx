let manhattan (a: int list) (b: int list) =
    List.map2 (fun x y -> abs (x - y)) a b |> List.sum

printfn "%d" (manhattan [1; 2] [4; 6])
