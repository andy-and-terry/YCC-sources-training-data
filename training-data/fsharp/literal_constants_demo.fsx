[<Literal>]
let MaxItems = 3

[<Literal>]
let Greeting = "hello"

let check n =
    match n with
    | MaxItems -> "at the limit"
    | n when n > MaxItems -> "over"
    | _ -> "under"

printfn "%s" (check 3)
printfn "%s" (check 10)
printfn "%s" (check 1)

let respond = function
    | Greeting -> "hi there"
    | other -> sprintf "unknown: %s" other

printfn "%s" (respond "hello")
printfn "%s" (respond "bye")
