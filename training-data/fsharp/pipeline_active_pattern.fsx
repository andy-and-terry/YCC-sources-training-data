let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

[1 .. 6]
|> List.map (function Even -> "e" | Odd -> "o")
|> String.concat ""
|> printfn "%s"
