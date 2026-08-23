let isPowerOfTwo n = n > 0 && (n &&& (n - 1)) = 0

printfn "%b" (isPowerOfTwo 16)
printfn "%b" (isPowerOfTwo 18)
