// Tower of Hanoi: recursive move list and an iterative bit-trick solution.

let rec hanoi n from target via =
    if n = 0 then []
    else
        hanoi (n - 1) from via target
        @ [ (from, target) ]
        @ hanoi (n - 1) via target from

let moves = hanoi 3 'A' 'C' 'B'

moves
|> List.iteri (fun i (f, t) -> printfn "Move %d: %c -> %c" (i + 1) f t)

printfn "Total moves: %d" (List.length moves)

// Iterative: the disk moved on step k is the number of trailing zero bits of k.
let trailingZeros k =
    let rec go k acc = if k &&& 1 = 1 then acc else go (k >>> 1) (acc + 1)
    go k 0

let diskSequence n =
    [ 1 .. (1 <<< n) - 1 ] |> List.map (fun k -> trailingZeros k + 1)

printfn "Disk moved at each step (n=3): %A" (diskSequence 3)
