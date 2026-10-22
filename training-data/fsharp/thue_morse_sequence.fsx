// Thue-Morse: t(n) is the parity of the number of 1 bits in n
let rec parity n = if n = 0 then 0 else (n &&& 1) ^^^ parity (n >>> 1)

[ 0 .. 31 ] |> List.map (parity >> string) |> String.concat "" |> printfn "%s"
