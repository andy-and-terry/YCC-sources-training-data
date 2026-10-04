let rec describe list =
    match list with
    | [] -> "empty"
    | [ x ] -> sprintf "singleton %d" x
    | [ x; y ] -> sprintf "pair %d %d" x y
    | x :: _ :: rest when List.length rest > 2 -> sprintf "long list starting %d" x
    | x :: rest -> sprintf "head %d with %d more" x (List.length rest)

let rec sumPairs = function
    | a :: b :: rest -> (a + b) :: sumPairs rest
    | [ x ] -> [ x ]
    | [] -> []

for l in [ []; [ 1 ]; [ 1; 2 ]; [ 1; 2; 3 ]; [ 1; 2; 3; 4; 5; 6 ] ] do
    printfn "%s" (describe l)

printfn "%A" (sumPairs [ 1; 2; 3; 4; 5 ])
