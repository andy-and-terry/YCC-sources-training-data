open System.Collections.Generic

let stack = Stack<string>()
for w in [ "a"; "b"; "c" ] do stack.Push w
printfn "peek: %s" (stack.Peek())
while stack.Count > 0 do
    printf "%s " (stack.Pop())
printfn ""

let queue = Queue<int>()
for n in [ 1; 2; 3 ] do queue.Enqueue n
printfn "front: %d" (queue.Peek())
printfn "dequeued: %d" (queue.Dequeue())
queue.Enqueue 4
printfn "%A" (queue.ToArray())

let linked = LinkedList<int>([ 2; 3 ])
linked.AddFirst 1 |> ignore
linked.AddLast 4 |> ignore
printfn "%A" (Seq.toList linked)
