// Deficient numbers below 100; expect 76.
let properSum n = [ 1 .. n - 1 ] |> List.filter (fun d -> n % d = 0) |> List.sum
printfn "%d" ([ 1 .. 99 ] |> List.filter (fun n -> properSum n < n) |> List.length)
