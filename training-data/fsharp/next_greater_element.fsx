let nextGreaterElements (values: int list) =
    let result = Array.create values.Length (-1)
    let arr = List.toArray values
    let mutable stack: int list = []
    for i in 0 .. arr.Length - 1 do
        while not stack.IsEmpty && arr.[List.head stack] < arr.[i] do
            result.[List.head stack] <- arr.[i]
            stack <- List.tail stack
        stack <- i :: stack
    Array.toList result

printfn "%A" (nextGreaterElements [ 4; 5; 2; 10; 8 ])
printfn "%A" (nextGreaterElements [ 3; 1; 2; 4 ])
