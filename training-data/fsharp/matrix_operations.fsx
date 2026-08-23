let transpose (matrix: int list list) =
    if List.isEmpty matrix then []
    else
        matrix.[0] |> List.mapi (fun i _ -> matrix |> List.map (fun row -> row.[i]))

let multiply (a: int list list) (b: int list list) =
    let bt = transpose b
    a |> List.map (fun row -> bt |> List.map (fun col -> List.map2 (*) row col |> List.sum))

let a = [ [ 1; 2 ]; [ 3; 4 ] ]
let b = [ [ 5; 6 ]; [ 7; 8 ] ]
printfn "%A" (transpose a)
printfn "%A" (multiply a b)
