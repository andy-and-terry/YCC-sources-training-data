let parseAge (input: string) : Result<int, string> =
    match System.Int32.TryParse input with
    | true, n -> Ok n
    | false, _ -> Error (sprintf "'%s' is not a number" input)

let validateAge (age: int) : Result<int, string> =
    if age >= 0 && age <= 120 then Ok age
    else Error (sprintf "%d is not a valid age" age)

let describeAge (age: int) : Result<string, string> =
    Ok (sprintf "age is %d" age)

let processAge (input: string) : Result<string, string> =
    parseAge input
    |> Result.bind validateAge
    |> Result.bind describeAge

[ "42"; "abc"; "200" ]
|> List.iter (fun input -> printfn "%A" (processAge input))
