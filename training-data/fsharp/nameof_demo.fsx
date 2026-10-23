type Person = { Name: string; Age: int }

let validate (age: int) =
    if age < 0 then
        invalidArg (nameof age) "must not be negative"
    else
        age

let describe (p: Person) =
    sprintf "%s=%s, %s=%d" (nameof p.Name) p.Name (nameof p.Age) p.Age

printfn "%s" (describe { Name = "Ada"; Age = 36 })
printfn "%s" (nameof validate)
printfn "%s" (nameof List.map)

try
    validate -1 |> ignore
with :? System.ArgumentException as ex ->
    printfn "caught: %s" ex.ParamName
