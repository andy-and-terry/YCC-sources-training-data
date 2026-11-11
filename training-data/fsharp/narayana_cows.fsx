// Narayana's cows N(n)=N(n-1)+N(n-3)
let extend (acc: int list) =
    let n = List.length acc
    acc @ [ acc.[n - 1] + acc.[n - 3] ]

[ 1 .. 7 ]
|> List.fold (fun acc _ -> extend acc) [ 1; 1; 1 ]
|> List.map string
|> String.concat " "
|> printfn "%s"
