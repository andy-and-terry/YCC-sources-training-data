// Leyland numbers: x^y + y^x for x >= y >= 2.
let leyland (x: int) (y: int) : bigint = pown (bigint x) y + pown (bigint y) x

let vals = [ for x in 2 .. 4 do for y in 2 .. x -> leyland x y ]
printfn "%s" (vals |> List.map string |> String.concat " ")
