type MaybeBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x

let maybe = MaybeBuilder()

let r =
    maybe {
        let! a = Some 3
        let! b = Some 4
        return a + b
    }

printfn "%A" r
