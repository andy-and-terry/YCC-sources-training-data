type PriorityQueue() =
    let items = System.Collections.Generic.List<int>()

    member this.Insert(value: int) =
        items.Add(value)
        let mutable i = items.Count - 1
        let mutable go = true
        while go && i > 0 do
            let parent = (i - 1) / 2
            if items.[parent] <= items.[i] then
                go <- false
            else
                let temp = items.[parent]
                items.[parent] <- items.[i]
                items.[i] <- temp
                i <- parent

    member this.ExtractMin() =
        let top = items.[0]
        let last = items.Count - 1
        items.[0] <- items.[last]
        items.RemoveAt(last)
        let n = items.Count
        let mutable i = 0
        let mutable go = true
        while go do
            let left = 2 * i + 1
            let right = 2 * i + 2
            let mutable smallest = i
            if left < n && items.[left] < items.[smallest] then smallest <- left
            if right < n && items.[right] < items.[smallest] then smallest <- right
            if smallest = i then go <- false
            else
                let temp = items.[i]
                items.[i] <- items.[smallest]
                items.[smallest] <- temp
                i <- smallest
        top

    member this.IsEmpty = items.Count = 0

let pq = PriorityQueue()
pq.Insert(30)
pq.Insert(10)
pq.Insert(20)
pq.Insert(5)
while not pq.IsEmpty do
    printfn "%d" (pq.ExtractMin())
