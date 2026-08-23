type Queue<'a>() =
    let mutable front: 'a list = []
    let mutable back: 'a list = []

    member this.Enqueue(x: 'a) = back <- x :: back

    member this.Dequeue() =
        match front with
        | h :: t ->
            front <- t
            Some h
        | [] ->
            match List.rev back with
            | [] -> None
            | h :: t ->
                front <- t
                back <- []
                Some h

let q = Queue<int>()
q.Enqueue 1
q.Enqueue 2
q.Enqueue 3
printfn "%A" (q.Dequeue())
printfn "%A" (q.Dequeue())
