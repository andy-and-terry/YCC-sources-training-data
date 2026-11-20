// Manhattan distance.
let manhattan a b = List.map2 (fun x y -> abs (x - y)) a b |> List.sum
printfn "%d" (manhattan [ 1; 2 ] [ 4; 6 ])
