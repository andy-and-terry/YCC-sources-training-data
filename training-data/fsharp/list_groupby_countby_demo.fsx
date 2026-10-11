let nums = [ 1 .. 12 ]

nums
|> List.groupBy (fun n -> n % 3)
|> List.iter (fun (k, vs) -> printfn "remainder %d: %A" k vs)

let words = [ "apple"; "avocado"; "banana"; "blueberry"; "cherry"; "apricot" ]

words
|> List.countBy (fun w -> w.[0])
|> List.sortBy fst
|> printfn "%A"

words
|> List.groupBy String.length
|> List.map (fun (len, ws) -> len, List.length ws)
|> printfn "%A"
