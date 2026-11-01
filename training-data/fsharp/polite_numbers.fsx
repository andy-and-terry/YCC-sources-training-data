// Ways to write n as a sum of two or more consecutive positive integers.
let politeWays n =
    Seq.initInfinite ((+) 2)
    |> Seq.takeWhile (fun k -> k * (k + 1) / 2 <= n)
    |> Seq.filter (fun k -> (n - k * (k - 1) / 2) % k = 0)
    |> Seq.length

[ 1 .. 16 ] |> List.map (politeWays >> string) |> String.concat " " |> printfn "%s"
