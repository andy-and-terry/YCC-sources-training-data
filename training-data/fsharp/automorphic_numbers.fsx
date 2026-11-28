let isAutomorphic (n: int64) = (string (n * n)).EndsWith(string n)

[ 0L .. 999L ] |> List.filter isAutomorphic |> printfn "%A" // [0; 1; 5; 6; 25; 76; 376; 625]
