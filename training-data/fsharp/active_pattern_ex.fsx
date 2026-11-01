let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

let (|Int|_|) (s: string) =
    match System.Int32.TryParse s with
    | true, v -> Some v
    | _ -> None

for s in [ "4"; "7"; "x" ] do
    match s with
    | Int(Even) -> printfn "%s even" s
    | Int(Odd) -> printfn "%s odd" s
    | _ -> printfn "%s not a number" s
