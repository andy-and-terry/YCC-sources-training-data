type Grid(w: int, h: int) =
    let cells = Array.zeroCreate<int> (w * h)

    member _.Item
        with get (x: int, y: int) = cells.[y * w + x]
        and set (x: int, y: int) (v: int) = cells.[y * w + x] <- v

    member _.Width = w
    member _.Height = h

let g = Grid(3, 2)
g.[0, 0] <- 1
g.[2, 1] <- 9
g.[1, 0] <- g.[0, 0] + 4

for y in 0 .. g.Height - 1 do
    [ for x in 0 .. g.Width - 1 -> string g.[x, y] ]
    |> String.concat " "
    |> printfn "%s"
