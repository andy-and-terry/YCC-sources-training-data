let rec digitSum n = if n < 10 then n else n % 10 + digitSum (n / 10)

printfn "%d" (digitSum 12345)
