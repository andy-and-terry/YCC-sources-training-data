let shiftChar k (c: char) =
    if System.Char.IsLower c then char ((int c - int 'a' + k + 26) % 26 + int 'a')
    elif System.Char.IsUpper c then char ((int c - int 'A' + k + 26) % 26 + int 'A')
    else c

let caesar k (text: string) = String.map (shiftChar k) text

let enc = caesar 3 "Hello, World!"
printfn "%s" enc
printfn "%s" (caesar -3 enc)
