let process name shouldFail =
    try
        try
            printfn "start %s" name
            if shouldFail then failwithf "%s failed" name
            printfn "finish %s" name
        with ex ->
            printfn "logging: %s" ex.Message
            reraise ()
    finally
        printfn "cleanup %s" name

process "job1" false

try
    process "job2" true
with ex ->
    printfn "outer caught: %s" ex.Message

let safeDiv a b =
    try Some(a / b) with :? System.DivideByZeroException -> None

printfn "%A %A" (safeDiv 10 2) (safeDiv 1 0)
