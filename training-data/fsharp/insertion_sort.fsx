let rec insert x items =
    match items with
    | [] -> [ x ]
    | h :: t when x <= h -> x :: h :: t
    | h :: t -> h :: insert x t

let insertionSort items = List.fold (fun acc x -> insert x acc) [] items

printfn "%A" (insertionSort [ 12; 11; 13; 5; 6 ])
