// n is triangular iff 8n + 1 is a perfect square.
let isTriangular n =
    let s = 8 * n + 1
    let r = int (round (sqrt (float s)))
    r * r = s

[ 0 .. 20 ] |> List.filter isTriangular |> List.map string |> String.concat " " |> printfn "%s"
