type LinkedList<'a> =
    | Nil
    | Cons of 'a * LinkedList<'a>

let rec toList lst =
    match lst with
    | Nil -> []
    | Cons(head, tail) -> head :: toList tail

let rec ofList items =
    match items with
    | [] -> Nil
    | h :: t -> Cons(h, ofList t)

let rec length lst =
    match lst with
    | Nil -> 0
    | Cons(_, tail) -> 1 + length tail

let rec reverse lst acc =
    match lst with
    | Nil -> acc
    | Cons(head, tail) -> reverse tail (Cons(head, acc))

let list = ofList [1; 2; 3; 4]
printfn "%A" (toList list)
printfn "%d" (length list)
printfn "%A" (toList (reverse list Nil))
