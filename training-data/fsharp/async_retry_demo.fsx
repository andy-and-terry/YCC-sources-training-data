let unreliableCall attempt =
    async {
        if attempt < 3 then
            return Error(sprintf "attempt %d failed" attempt)
        else
            return Ok(sprintf "succeeded on attempt %d" attempt)
    }

let rec withRetry maxAttempts attempt =
    async {
        let! result = unreliableCall attempt
        match result with
        | Ok value -> return Ok value
        | Error msg when attempt >= maxAttempts -> return Error msg
        | Error msg ->
            printfn "retrying after: %s" msg
            do! Async.Sleep 10
            return! withRetry maxAttempts (attempt + 1)
    }

let outcome = withRetry 5 1 |> Async.RunSynchronously
printfn "%A" outcome
