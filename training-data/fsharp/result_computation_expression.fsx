type ResultBuilder() =
    member _.Bind(x, f) =
        match x with
        | Ok v -> f v
        | Error e -> Error e

    member _.Return(x) = Ok x

let result = ResultBuilder()

let parseAge (input: string) =
    match System.Int32.TryParse input with
    | true, n -> Ok n
    | false, _ -> Error(sprintf "'%s' is not a number" input)

let describe input =
    result {
        let! age = parseAge input
        let! doubled = if age >= 0 then Ok(age * 2) else Error "negative age"
        return sprintf "age %d doubled is %d" age doubled
    }

printfn "%A" (describe "21")
printfn "%A" (describe "abc")
