let fizzBuzz n =
    match n % 3, n % 5 with
    | 0, 0 -> "FizzBuzz"
    | 0, _ -> "Fizz"
    | _, 0 -> "Buzz"
    | _ -> string n

let describePoint point =
    match point with
    | 0, 0 -> "origin"
    | x, 0 -> sprintf "on x-axis at %d" x
    | 0, y -> sprintf "on y-axis at %d" y
    | x, y when x = y -> "on diagonal"
    | _ -> "elsewhere"

[ 1 .. 15 ] |> List.map fizzBuzz |> String.concat " " |> printfn "%s"
[ (0, 0); (3, 0); (0, 4); (2, 2); (1, 5) ] |> List.iter (describePoint >> printfn "%s")
