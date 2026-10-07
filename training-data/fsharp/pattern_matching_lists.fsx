let rec describe xs =
    match xs with
    | [] -> "empty"
    | [ x ] -> sprintf "singleton %d" x
    | [ x; y ] -> sprintf "pair %d %d" x y
    | x :: _ :: _ :: rest -> sprintf "starts with %d, then %d more after two" x rest.Length

let rec sumPairs xs =
    match xs with
    | a :: b :: rest -> (a + b) :: sumPairs rest
    | [ a ] -> [ a ]
    | [] -> []

let classify (x, y) =
    match x, y with
    | 0, 0 -> "origin"
    | 0, _ -> "y-axis"
    | _, 0 -> "x-axis"
    | a, b when a = b -> "diagonal"
    | _ -> "plane"

printfn "%s" (describe [])
printfn "%s" (describe [ 1; 2 ])
printfn "%s" (describe [ 1; 2; 3; 4 ])
printfn "%A" (sumPairs [ 1; 2; 3; 4; 5 ])
printfn "%s %s %s" (classify (0, 0)) (classify (3, 3)) (classify (1, 2))
