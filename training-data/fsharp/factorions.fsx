let fact = [| 1; 1; 2; 6; 24; 120; 720; 5040; 40320; 362880 |]

let isFactorion n =
    string n |> Seq.sumBy (fun c -> fact.[int c - int '0']) = n

[ 1 .. 49999 ] |> List.filter isFactorion |> printfn "%A" // [1; 2; 145; 40585]
