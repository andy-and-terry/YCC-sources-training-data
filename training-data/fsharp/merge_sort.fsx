let rec merge left right =
    match left, right with
    | [], r -> r
    | l, [] -> l
    | lx :: ls, rx :: rs when lx <= rx -> lx :: merge ls (rx :: rs)
    | l, rx :: rs -> rx :: merge l rs

let rec mergeSort items =
    match items with
    | [] -> []
    | [ x ] -> [ x ]
    | _ ->
        let mid = List.length items / 2
        let left, right = List.splitAt mid items
        merge (mergeSort left) (mergeSort right)

printfn "%A" (mergeSort [ 5; 2; 9; 1; 5; 6 ])
