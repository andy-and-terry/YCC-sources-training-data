let s = "abcabc"
let k, b, m = 3, 31, 1000003
let hash (w: string) = w |> Seq.fold (fun h c -> (h * b + int c) % m) 0
for i in 0 .. s.Length - k do
    printfn "%d %d" i (hash (s.Substring(i, k)))
