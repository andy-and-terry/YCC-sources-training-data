let fizzbuzz n =
    match n % 3, n % 5 with
    | 0, 0 -> "FizzBuzz"
    | 0, _ -> "Fizz"
    | _, 0 -> "Buzz"
    | _ -> string n

[ 1 .. 15 ] |> List.map fizzbuzz |> String.concat " " |> printfn "%s"
