let inline square x = x * x

printfn "%d" (square 7)
printfn "%f" (square 2.5)
printfn "%d" (square 3L |> int)

let inline sumAll (items: seq<'T>) =
    let mutable total = LanguagePrimitives.GenericZero<'T>
    for i in items do
        total <- total + i
    total

printfn "%d" (sumAll [ 1; 2; 3 ])
printfn "%f" (sumAll [ 1.5; 2.5 ])
printfn "%M" (sumAll [ 1.1M; 2.2M ])

let inline half x = x / (LanguagePrimitives.GenericOne + LanguagePrimitives.GenericOne)
printfn "%f" (half 9.0)
printfn "%d" (half 9)
