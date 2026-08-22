let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

let describe n =
    match n with
    | Even -> sprintf "%d is even" n
    | Odd -> sprintf "%d is odd" n

[ 1; 2; 3; 4 ] |> List.iter (fun n -> printfn "%s" (describe n))
