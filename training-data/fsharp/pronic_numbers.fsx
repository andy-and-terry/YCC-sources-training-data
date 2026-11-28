let isPronic (x: int) =
    let n = int (sqrt (float x))
    n * (n + 1) = x

[ 0 .. 9 ] |> List.map (fun n -> n * (n + 1)) |> printfn "%A" // [0; 2; 6; 12; 20; 30; 42; 56; 72; 90]
printfn "%b %b" (isPronic 56) (isPronic 57) // true false
