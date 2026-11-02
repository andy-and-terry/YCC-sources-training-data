let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

let describe = function
    | Even -> "even"
    | Odd -> "odd"

[1; 2; 3] |> List.iter (describe >> printfn "%s")
