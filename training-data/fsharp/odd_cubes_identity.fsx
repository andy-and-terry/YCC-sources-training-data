let cubeFromOdds n =
    let start = n * n - n + 1
    [ for i in 0 .. n - 1 -> start + 2 * i ] |> List.sum

for n in 1 .. 5 do
    printfn "%d %d %b" n (cubeFromOdds n) (cubeFromOdds n = n * n * n)
