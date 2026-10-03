type Tree =
    | Leaf
    | Node of int * Tree * Tree

let diameter tree =
    let mutable maxDiameter = 0

    let rec height t =
        match t with
        | Leaf -> 0
        | Node(_, left, right) ->
            let leftHeight = height left
            let rightHeight = height right
            maxDiameter <- max maxDiameter (leftHeight + rightHeight)
            max leftHeight rightHeight + 1

    height tree |> ignore
    maxDiameter

let tree = Node(1, Node(2, Node(4, Leaf, Leaf), Node(5, Leaf, Leaf)), Node(3, Leaf, Leaf))

printfn "%d" (diameter tree)
