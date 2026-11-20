// Aliquot sum classification.
let aliquot n = [ 1 .. n - 1 ] |> List.filter (fun d -> n % d = 0) |> List.sum
for n in [ 6; 12; 15; 28 ] do
    let a = aliquot n
    let kind = if a = n then "perfect" elif a > n then "abundant" else "deficient"
    printfn "%d %d %s" n a kind
