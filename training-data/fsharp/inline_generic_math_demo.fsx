let inline square x = x * x
let inline average (xs: seq<'T>) : 'T =
    let mutable total = LanguagePrimitives.GenericZero<'T>
    let mutable count = 0
    for x in xs do
        total <- total + x
        count <- count + 1
    LanguagePrimitives.DivideByInt total count

let inline sumBy f xs = xs |> Seq.fold (fun acc x -> acc + f x) LanguagePrimitives.GenericZero

printfn "%d" (square 7)
printfn "%f" (square 1.5)
printfn "%M" (square 2.5m)
printfn "%f" (average [ 1.0; 2.0; 4.0 ])
printfn "%M" (average [ 10m; 20m ])
printfn "%d" (sumBy (fun x -> x * 2) [ 1; 2; 3 ])
printfn "%f" (sumBy float [ 1; 2; 3 ])
printfn "%d" (int (abs -5L))
printfn "%d" (max 3 9)
