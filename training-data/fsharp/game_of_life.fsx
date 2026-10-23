// Conway's Game of Life with an immutable Set of live cells.

type Cell = int * int

let neighbors (r, c) : Cell list =
    [ for dr in -1 .. 1 do
        for dc in -1 .. 1 do
            if (dr, dc) <> (0, 0) then yield (r + dr, c + dc) ]

let step (alive: Set<Cell>) : Set<Cell> =
    alive
    |> Seq.collect neighbors
    |> Seq.countBy id
    |> Seq.filter (fun (cell, n) -> n = 3 || (n = 2 && alive.Contains cell))
    |> Seq.map fst
    |> Set.ofSeq

let render rows cols (alive: Set<Cell>) =
    [ for r in 0 .. rows - 1 ->
        [ for c in 0 .. cols - 1 -> if alive.Contains(r, c) then '#' else '.' ]
        |> System.String.Concat ]
    |> String.concat "\n"

let glider = set [ (0, 1); (1, 2); (2, 0); (2, 1); (2, 2) ]

Seq.unfold (fun s -> Some(s, step s)) glider
|> Seq.truncate 4
|> Seq.iteri (fun gen state ->
    printfn "Generation %d:" gen
    printfn "%s" (render 5 5 state))
