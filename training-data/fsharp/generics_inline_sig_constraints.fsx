let inline add (a: ^T) (b: ^T) : ^T = a + b
printfn "%d %f %s" (add 1 2) (add 1.5 2.5) (add "a" "b")

let swap (a, b) = (b, a)
printfn "%A" (swap (1, "x"))

type Stack<'T> = { Items: 'T list } with
    member s.Push x = { Items = x :: s.Items }
    member s.Pop() = match s.Items with | h :: t -> Some(h, { Items = t }) | [] -> None

let s = { Items = [] }.Push(1).Push(2)
printfn "%A" (s.Pop() |> Option.map fst)

let largest (xs: 'a list) = List.max xs
printfn "%d" (largest [ 3; 9; 4 ])
