type OptionBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x

let maybe = OptionBuilder()

let r = maybe {
    let! a = Some 2
    let! b = Some 3
    return a * b
}
printfn "%A" r
