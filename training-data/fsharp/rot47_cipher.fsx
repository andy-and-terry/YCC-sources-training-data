let rot47 (s: string) =
    s |> String.map (fun c ->
        let n = int c
        if n >= 33 && n <= 126 then char (33 + (n - 33 + 47) % 94) else c)

let e = rot47 "Hello, World!"
printfn "%s" e
printfn "%s" (rot47 e)
