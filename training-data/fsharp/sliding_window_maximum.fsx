let slidingWindowMax (values: int[]) (k: int) =
    let n = values.Length
    let result = ResizeArray<int>()
    let deque = System.Collections.Generic.LinkedList<int>()
    for i in 0 .. n - 1 do
        while deque.Count > 0 && deque.First.Value <= i - k do
            deque.RemoveFirst()
        while deque.Count > 0 && values.[deque.Last.Value] <= values.[i] do
            deque.RemoveLast()
        deque.AddLast(i) |> ignore
        if i >= k - 1 then
            result.Add(values.[deque.First.Value])
    result |> List.ofSeq

let values = [| 1; 3; -1; -3; 5; 3; 6; 7 |]
printfn "%A" (slidingWindowMax values 3)
