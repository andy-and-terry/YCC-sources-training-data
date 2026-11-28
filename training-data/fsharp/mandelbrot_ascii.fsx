let escape cr ci =
    let rec go zr zi n =
        if n = 30 || zr * zr + zi * zi >= 4.0 then n
        else go (zr * zr - zi * zi + cr) (2.0 * zr * zi + ci) (n + 1)
    go 0.0 0.0 0

for yi in -5 .. 5 do
    [ for xi in -40 .. 12 -> if escape (float xi / 20.0) (float yi / 5.0) = 30 then '#' else '.' ]
    |> System.String.Concat
    |> printfn "%s"
