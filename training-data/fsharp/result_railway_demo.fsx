type ValidationError =
    | Empty
    | TooLong of int

let validateNotEmpty (s: string) =
    if s.Length = 0 then Error Empty else Ok s

let validateLength maxLen (s: string) =
    if s.Length > maxLen then Error(TooLong s.Length) else Ok s

let validateUsername (s: string) =
    validateNotEmpty s
    |> Result.bind (validateLength 10)

let describe result =
    match result with
    | Ok s -> sprintf "valid: %s" s
    | Error Empty -> "invalid: empty"
    | Error (TooLong n) -> sprintf "invalid: too long (%d chars)" n

printfn "%s" (describe (validateUsername "alice"))
printfn "%s" (describe (validateUsername ""))
printfn "%s" (describe (validateUsername "waaaaaaaaaaay_too_long"))
