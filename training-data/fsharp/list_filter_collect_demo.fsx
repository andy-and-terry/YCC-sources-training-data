let nums = [ 1 .. 10 ]

let evens = nums |> List.filter (fun n -> n % 2 = 0)
printfn "%A" evens

let doubled = nums |> List.collect (fun n -> [ n; n * 10 ]) |> List.take 6
printfn "%A" doubled

let pairs = [ for x in 1 .. 3 do for y in [ 'a'; 'b' ] -> (x, y) ]
printfn "%A" pairs

let flat = List.concat [ [ 1; 2 ]; [ 3 ]; [] ]
printfn "%A" flat
