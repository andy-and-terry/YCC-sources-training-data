let rec hanoi n a b c =
    if n = 0 then []
    else hanoi (n - 1) a c b @ [ (a, c) ] @ hanoi (n - 1) b a c

let moves = hanoi 3 'A' 'B' 'C'
printfn "%d: %A" moves.Length moves
