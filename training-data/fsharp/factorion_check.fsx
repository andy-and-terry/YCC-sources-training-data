let fact = [| 1; 1; 2; 6; 24; 120; 720; 5040; 40320; 362880 |]

let isFactorion (n: int) =
    string n |> Seq.sumBy (fun c -> fact.[int c - int '0']) = n

printfn "%A" [ for n in 1 .. 49999 do if isFactorion n then yield n ]
