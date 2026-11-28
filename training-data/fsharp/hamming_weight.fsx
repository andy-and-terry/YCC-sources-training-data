let rec popcount n = if n = 0UL then 0 else 1 + popcount (n &&& (n - 1UL))

printfn "%d %d" (popcount 0xB7UL) (System.Numerics.BitOperations.PopCount 0xB7UL)
