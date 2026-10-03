type MinStack() =
    let mutable stack: int list = []
    let mutable mins: int list = []

    member _.Push(value: int) =
        stack <- value :: stack
        match mins with
        | top :: _ when top < value -> ()
        | _ -> mins <- value :: mins

    member _.Pop() =
        match stack, mins with
        | v :: vs, m :: ms when v = m ->
            stack <- vs
            mins <- ms
        | v :: vs, _ ->
            stack <- vs
        | [], _ -> ()

    member _.Min = List.head mins

let stack = MinStack()
stack.Push 5
stack.Push 2
stack.Push 7
printfn "%d" stack.Min
stack.Pop()
printfn "%d" stack.Min
