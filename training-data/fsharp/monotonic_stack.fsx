let nextGreaterElements (nums: int[]) =
    let result = Array.create nums.Length -1
    let stack = System.Collections.Generic.Stack<int>()

    for i in 0 .. nums.Length - 1 do
        while stack.Count > 0 && nums.[stack.Peek()] < nums.[i] do
            result.[stack.Pop()] <- nums.[i]
        stack.Push i

    result

printfn "%A" (nextGreaterElements [| 4; 5; 2; 25; 7; 8 |])
