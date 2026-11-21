// Amicable pairs below 1500 via sums of proper divisors.
let s n = [ 1 .. n - 1 ] |> List.filter (fun d -> n % d = 0) |> List.sum

for a in 2 .. 1499 do
    let b = s a
    if b > a && s b = a then printfn "%d %d" a b
