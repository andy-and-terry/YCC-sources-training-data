type MaybeBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return(x) = Some x

let maybe = MaybeBuilder()

let safeDiv a b = if b = 0 then None else Some(a / b)

let r =
    maybe {
        let! x = safeDiv 100 5
        let! y = safeDiv x 2
        return x + y
    }

printfn "%A" r
