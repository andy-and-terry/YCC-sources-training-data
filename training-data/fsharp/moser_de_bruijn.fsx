// Moser-de Bruijn sequence: binary digits of n read in base 4.
let rec moser n = if n = 0 then 0 else (n &&& 1) + 4 * moser (n >>> 1)

[ 0 .. 11 ] |> List.map (moser >> string) |> String.concat " " |> printfn "%s"
