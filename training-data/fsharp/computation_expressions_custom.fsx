type MaybeBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x
    member _.ReturnFrom x = x

let maybe = MaybeBuilder()

let tryInt (s: string) = match System.Int32.TryParse s with | true, n -> Some n | _ -> None

let sum a b = maybe {
    let! x = tryInt a
    let! y = tryInt b
    return x + y
}

printfn "%A %A" (sum "1" "2") (sum "1" "x")

let squares = seq { for i in 1 .. 5 do yield i * i }
printfn "%A" (Seq.toList squares)
let evens = [ for i in 1 .. 10 do if i % 2 = 0 then yield i ]
printfn "%A" evens
