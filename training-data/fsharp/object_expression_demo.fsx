type IGreeter =
    abstract member Greet: string -> string

let makeGreeter (prefix: string) =
    { new IGreeter with
        member _.Greet(name) = sprintf "%s, %s!" prefix name }

let formal = makeGreeter "Good day"
let casual = makeGreeter "Hey"

printfn "%s" (formal.Greet "Alice")
printfn "%s" (casual.Greet "Bob")
