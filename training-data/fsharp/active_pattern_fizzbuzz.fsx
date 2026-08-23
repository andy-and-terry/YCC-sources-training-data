let (|FizzBuzz|Fizz|Buzz|Number|) n =
    if n % 15 = 0 then FizzBuzz
    elif n % 3 = 0 then Fizz
    elif n % 5 = 0 then Buzz
    else Number n

let describe n =
    match n with
    | FizzBuzz -> "FizzBuzz"
    | Fizz -> "Fizz"
    | Buzz -> "Buzz"
    | Number n -> string n

[ 1 .. 20 ] |> List.map describe |> List.iter (printf "%s ")
printfn ""
