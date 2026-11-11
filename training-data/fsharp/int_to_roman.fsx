// Integer (1..3999) to Roman numeral using a greedy table.
let table =
    [ 1000, "M"; 900, "CM"; 500, "D"; 400, "CD"; 100, "C"; 90, "XC"
      50, "L"; 40, "XL"; 10, "X"; 9, "IX"; 5, "V"; 4, "IV"; 1, "I" ]

let toRoman n =
    let rest, out =
        table
        |> List.fold (fun (rest, out) (value, symbol) ->
            rest % value, out + String.replicate (rest / value) symbol) (n, "")
    out

printfn "%s %s" (toRoman 1994) (toRoman 58)
