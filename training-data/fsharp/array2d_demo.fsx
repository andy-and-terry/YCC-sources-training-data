let grid = Array2D.init 3 4 (fun r c -> r * 4 + c)

printfn "rows=%d cols=%d" (Array2D.length1 grid) (Array2D.length2 grid)

for r in 0 .. Array2D.length1 grid - 1 do
    [ for c in 0 .. Array2D.length2 grid - 1 -> sprintf "%3d" grid.[r, c] ]
    |> String.concat ""
    |> printfn "%s"

let transposed = Array2D.init 4 3 (fun r c -> grid.[c, r])
printfn "transposed[3,2] = %d" transposed.[3, 2]

let doubled = grid |> Array2D.map (fun x -> x * 2)
printfn "doubled[2,3] = %d" doubled.[2, 3]
printfn "slice row 1: %A" grid.[1, *]
