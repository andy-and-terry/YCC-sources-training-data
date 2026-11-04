let ordinal n =
  let suffix =
    match (n mod 100, n mod 10) with
    | (11 | 12 | 13), _ -> "th"
    | _, 1 -> "st"
    | _, 2 -> "nd"
    | _, 3 -> "rd"
    | _ -> "th"
  in
  string_of_int n ^ suffix

let () =
  [ 1; 2; 3; 4; 11; 12; 13; 21; 101; 111 ] |> List.map ordinal |> String.concat " " |> print_endline
