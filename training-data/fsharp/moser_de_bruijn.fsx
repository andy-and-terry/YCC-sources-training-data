// Read the binary digits of i as base-4 digits.
let rec moser i = if i = 0 then 0 else (i &&& 1) + 4 * moser (i >>> 1)

printfn "%s" ([ 0 .. 9 ] |> List.map (moser >> string) |> String.concat " ") // 0 1 4 5 16 17 20 21 64 65
