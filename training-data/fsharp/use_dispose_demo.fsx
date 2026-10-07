open System

let resource name =
    printfn "open %s" name
    { new IDisposable with
        member _.Dispose() = printfn "close %s" name }

let run () =
    use a = resource "A"
    use b = resource "B"
    printfn "working"
    failwith "boom"

try
    run ()
with ex ->
    printfn "caught: %s" ex.Message

try
    printfn "in try"
finally
    printfn "finally runs"
