type CircularBuffer(capacity: int) =
    let data = Array.create capacity 0
    let mutable size = 0
    let mutable start = 0

    member this.Push(value: int) =
        let index = (start + size) % capacity
        data.[index] <- value
        if size < capacity then size <- size + 1
        else start <- (start + 1) % capacity

    member this.ToList() =
        [ for i in 0 .. size - 1 -> data.[(start + i) % capacity] ]

let buf = CircularBuffer(3)
[ 1; 2; 3; 4; 5 ] |> List.iter buf.Push
printfn "%A" (buf.ToList())
