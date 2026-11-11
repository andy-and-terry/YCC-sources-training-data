// Square of the sum minus sum of squares for 1..10 (expect 2640)
let xs = [ 1 .. 10 ]
let total = List.sum xs
let squares = xs |> List.sumBy (fun x -> x * x)
printfn "%d" (total * total - squares)
