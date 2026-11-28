let reverseBits (v: int) =
    let rec go k x acc =
        if k = 0 then acc else go (k - 1) (x >>> 1) ((acc <<< 1) ||| (x &&& 1))
    go 8 v 0

for v in [ 1; 6; 13; 128 ] do
    printfn "%d %d" v (reverseBits v) // 128 96 176 1
