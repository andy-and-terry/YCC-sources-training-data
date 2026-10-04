let csv = "name, age ,city,,"

let fields =
    csv.Split(',')
    |> Array.map (fun s -> s.Trim())
    |> Array.filter (fun s -> s <> "")

printfn "%A" fields
printfn "%s" (String.concat " | " fields)
printfn "%A" (csv.Split([| ',' |], System.StringSplitOptions.RemoveEmptyEntries))
printfn "%A" ("a1b22c333".ToCharArray() |> Array.filter System.Char.IsDigit |> System.String)
printfn "%s" ("hello world".Replace("o", "0").ToUpper())
printfn "%b" ("Hello".StartsWith "He" && "Hello".EndsWith "lo")
printfn "%s" (String.replicate 3 "ab")
printfn "%A" ("one two  three".Split([| ' ' |], System.StringSplitOptions.RemoveEmptyEntries))
printfn "%s" ("x".PadLeft(4, '.') + "|" + "x".PadRight(4, '.'))
