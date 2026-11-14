[ 1 .. 20 ]
|> List.filter (fun n -> n % 3 = 0)
|> List.map (fun n -> n * n)
|> List.sum
|> printfn "%d"
