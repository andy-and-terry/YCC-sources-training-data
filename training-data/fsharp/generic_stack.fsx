type Stack<'a>() =
    let mutable items: 'a list = []

    member this.Push(x: 'a) = items <- x :: items

    member this.Pop() =
        match items with
        | [] -> None
        | h :: t ->
            items <- t
            Some h

    member this.IsEmpty = List.isEmpty items

let s = Stack<int>()
s.Push 1
s.Push 2
s.Push 3
printfn "%A" (s.Pop())
printfn "%A" (s.Pop())
