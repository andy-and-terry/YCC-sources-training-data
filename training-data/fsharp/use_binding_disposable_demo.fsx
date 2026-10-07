open System

type Resource(name: string) =
    do printfn "open %s" name
    member _.Read() = sprintf "data from %s" name
    interface IDisposable with
        member _.Dispose() = printfn "close %s" name

let readOne () =
    use r = new Resource("A")
    r.Read()

printfn "%s" (readOne ())

let nested () =
    use a = new Resource("outer")
    use b = new Resource("inner")
    printfn "%s + %s" (a.Read()) (b.Read())

nested ()

try
    use r = new Resource("failing")
    failwith "boom"
with ex ->
    printfn "caught: %s" ex.Message

using (new Resource("explicit")) (fun r -> printfn "%s" (r.Read()))

let guard =
    { new IDisposable with
        member _.Dispose() = printfn "guard released" }

do
    use _g = guard
    printfn "inside guarded block"
