let ordinal n =
    let suffix =
        match n % 100, n % 10 with
        | (11 | 12 | 13), _ -> "th"
        | _, 1 -> "st"
        | _, 2 -> "nd"
        | _, 3 -> "rd"
        | _ -> "th"
    sprintf "%d%s" n suffix

[ 1; 2; 3; 4; 11; 12; 13; 21; 101; 111 ] |> List.map ordinal |> String.concat " " |> printfn "%s"
