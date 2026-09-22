type LoggingBuilder() =
    member _.Bind(x, f) =
        printfn "value: %A" x
        f x

    member _.Return(x) = x

let logging = LoggingBuilder()

let result =
    logging {
        let! a = 5
        let! b = a * 2
        let! c = b + 1
        return c
    }

printfn "result: %d" result
