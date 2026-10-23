let tryDivide a b : int voption =
    if b = 0 then ValueNone else ValueSome(a / b)

let describe v =
    match v with
    | ValueSome x -> sprintf "got %d" x
    | ValueNone -> "nothing"

printfn "%s" (describe (tryDivide 10 2))
printfn "%s" (describe (tryDivide 1 0))

let doubled = tryDivide 20 4 |> ValueOption.map (fun x -> x * 2)
printfn "%A" doubled
printfn "%d" (tryDivide 1 0 |> ValueOption.defaultValue -1)
printfn "%b" (ValueOption.isSome (tryDivide 6 3))
printfn "%A" (tryDivide 8 2 |> ValueOption.bind (fun x -> tryDivide 100 x))
