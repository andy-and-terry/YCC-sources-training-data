let rec transpose = function
    | [] | [] :: _ -> []
    | rows -> List.map List.head rows :: transpose (List.map List.tail rows)

let m = [ [ 1; 2; 3 ]; [ 4; 5; 6 ] ]
printfn "%A" (transpose m)
printfn "%A" (List.transpose m)
printfn "%A" (transpose (transpose m) = m)

let a2 = array2D [ [ 1; 2 ]; [ 3; 4 ]; [ 5; 6 ] ]
let t2 = Array2D.init 2 3 (fun i j -> a2.[j, i])
printfn "%A" t2
