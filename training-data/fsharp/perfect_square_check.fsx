let isPerfectSquare n =
    n >= 0 && (let r = int (round (sqrt (float n))) in r * r = n)

[ 0 .. 29 ] |> List.filter isPerfectSquare |> printfn "%A"
