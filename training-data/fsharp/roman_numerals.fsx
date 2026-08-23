let values =
    [ 1000, "M"; 900, "CM"; 500, "D"; 400, "CD"; 100, "C"; 90, "XC"
      50, "L"; 40, "XL"; 10, "X"; 9, "IX"; 5, "V"; 4, "IV"; 1, "I" ]

let rec toRoman n =
    if n = 0 then ""
    else
        let value, symbol = values |> List.find (fun (v, _) -> v <= n)
        symbol + toRoman (n - value)

printfn "%s" (toRoman 1994)
