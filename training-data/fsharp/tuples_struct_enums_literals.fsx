let (a, b, c) = (1, "two", 3.0)
printfn "%d %s %f" a b c
let t = struct (1, 2)
let struct (x, y) = t
printfn "%d" (x + y)

type Color =
    | Red = 1
    | Green = 2
    | Blue = 4

let flags = Color.Red ||| Color.Blue
printfn "%A %d %b" flags (int flags) (flags.HasFlag Color.Green)

[<Literal>]
let Limit = 10

let check n = match n with | Limit -> "limit" | _ -> "other"
printfn "%s %s" (check 10) (check 3)
printfn "%A" (fst (1, 2), snd (1, 2), List.unzip [ (1, 'a'); (2, 'b') ])
