let popcount (n: int) = System.Numerics.BitOperations.PopCount(uint32 n)
let gould n = 1 <<< popcount n

[ 0 .. 15 ] |> List.map gould |> printfn "%A"
