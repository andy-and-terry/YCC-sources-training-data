type OptionBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x

let maybe = OptionBuilder()

let r = maybe {
    let! a = Some 1
    let! b = Some 2
    return a + b
}
printfn "%A" r
