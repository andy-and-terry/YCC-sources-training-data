// Cantor pairing function and its inverse.
let pair x y = (x + y) * (x + y + 1) / 2 + y

let unpair z =
    let w = (int (sqrt (float (8 * z + 1))) - 1) / 2
    let y = z - w * (w + 1) / 2
    (w - y, y)

printfn "%d" (pair 3 4)
let (x, y) = unpair 32
printfn "%d %d" x y
