type MaybeBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x
let maybe = MaybeBuilder()
let r = maybe {
    let! a = Some 3
    let! b = "4" |> System.Int32.TryParse |> function | true, v -> Some v | _ -> None
    return a + b
}
printfn "%A" r
