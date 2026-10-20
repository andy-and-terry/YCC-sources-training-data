exception ValidationError of string * int

let validate n =
    if n < 0 then raise (ValidationError("negative", n))
    elif n > 100 then failwithf "too big: %d" n
    else n

for v in [ 5; -1; 200 ] do
    try
        printfn "ok %d" (validate v)
    with
    | ValidationError(msg, code) -> printfn "validation %s %d" msg code
    | Failure msg -> printfn "failure %s" msg

let r =
    try Ok(int "zz")
    with :? System.FormatException as e -> Error e.Message
printfn "%A" (Result.isError r)

try
    try failwith "inner"
    finally printfn "finally ran"
with e -> printfn "outer caught %s" e.Message
use d = { new System.IDisposable with member _.Dispose() = printfn "disposed" }
printfn "end"
