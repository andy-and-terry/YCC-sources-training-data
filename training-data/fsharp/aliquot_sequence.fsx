// Aliquot sequence: replace n by the sum of its proper divisors.
let aliquotSum n = [ 1 .. n / 2 ] |> List.filter (fun d -> n % d = 0) |> List.sum

let rec aliquot n count =
    if n <= 1 || count >= 20 then [ n ] else n :: aliquot (aliquotSum n) (count + 1)

aliquot 12 0 |> List.map string |> String.concat " " |> printfn "%s"
