let classify n =
    match n with
    | 0 -> "zero"
    | n when n < 0 -> "negative"
    | n when n % 2 = 0 && n > 100 -> "large even"
    | n when n % 2 = 0 -> "even"
    | _ -> "odd"

[ 0; -3; 4; 200; 7 ] |> List.iter (fun n -> printfn "%d is %s" n (classify n))

let describePoint point =
    match point with
    | (0, 0) -> "origin"
    | (x, 0) | (0, x) -> sprintf "on an axis at %d" x
    | (x, y) when x = y -> "on the diagonal"
    | _ -> "somewhere else"

[ (0, 0); (3, 0); (0, -2); (5, 5); (1, 2) ]
|> List.iter (fun p -> printfn "%A: %s" p (describePoint p))

let describeList = function
    | [] -> "empty"
    | [ x ] -> sprintf "one: %d" x
    | x :: y :: _ when x = y -> "starts with a pair"
    | x :: _ -> sprintf "starts with %d" x

[ []; [ 1 ]; [ 2; 2; 3 ]; [ 4; 5 ] ] |> List.iter (describeList >> printfn "%s")
