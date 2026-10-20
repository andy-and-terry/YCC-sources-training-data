let mutable total = 0
for i in 1 .. 10 do
    total <- total + i
printfn "%d" total

let mutable n = 27
let mutable steps = 0
while n <> 1 do
    n <- if n % 2 = 0 then n / 2 else 3 * n + 1
    steps <- steps + 1
printfn "%d" steps

let arr = Array.zeroCreate<int> 5
for i in 0 .. arr.Length - 1 do arr.[i] <- i * i
printfn "%A" arr
let m = Array2D.init 2 3 (fun r c -> r * 3 + c)
printfn "%A %d" m m.[1, 2]
for i in 10 .. -3 .. 0 do printf "%d " i
printfn ""
let r = ref 0
r.Value <- r.Value + 5
printfn "%d" r.Value
