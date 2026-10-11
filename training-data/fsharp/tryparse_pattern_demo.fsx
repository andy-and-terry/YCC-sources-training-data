open System

let (|Int|_|) (s: string) =
    match Int32.TryParse s with
    | true, v -> Some v
    | _ -> None

let (|Float|_|) (s: string) =
    match Double.TryParse(s, Globalization.NumberStyles.Float, Globalization.CultureInfo.InvariantCulture) with
    | true, v -> Some v
    | _ -> None

let classify s =
    match s with
    | Int i -> sprintf "int %d" i
    | Float f -> sprintf "float %g" f
    | "" -> "empty"
    | _ -> "text"

for s in [ "42"; "3.14"; ""; "hello"; "-7" ] do
    printfn "%-6s -> %s" s (classify s)
