// Perrin sequence P(n)=P(n-2)+P(n-3)
let extend (acc: int list) =
    let n = List.length acc
    acc @ [ acc.[n - 2] + acc.[n - 3] ]

[ 1 .. 7 ]
|> List.fold (fun acc _ -> extend acc) [ 3; 0; 2 ]
|> List.map string
|> String.concat " "
|> printfn "%s"
