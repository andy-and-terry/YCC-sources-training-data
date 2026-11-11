// Amicable pairs: d(a) = b and d(b) = a with a <> b.
let d n = [ 1 .. n - 1 ] |> List.filter (fun i -> n % i = 0) |> List.sum

for a in 2 .. 1499 do
    let b = d a
    if b > a && d b = a then printfn "%d %d" a b
