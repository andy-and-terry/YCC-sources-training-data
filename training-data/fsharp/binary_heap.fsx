type MinHeap() =
    let items = ResizeArray<int>()

    member private this.SwapUp(i: int) =
        let mutable idx = i
        while idx > 0 && items.[(idx - 1) / 2] > items.[idx] do
            let parent = (idx - 1) / 2
            let temp = items.[idx]
            items.[idx] <- items.[parent]
            items.[parent] <- temp
            idx <- parent

    member private this.SwapDown(i: int) =
        let mutable idx = i
        let mutable keepGoing = true
        while keepGoing do
            let left = 2 * idx + 1
            let right = 2 * idx + 2
            let mutable smallest = idx
            if left < items.Count && items.[left] < items.[smallest] then smallest <- left
            if right < items.Count && items.[right] < items.[smallest] then smallest <- right
            if smallest <> idx then
                let temp = items.[idx]
                items.[idx] <- items.[smallest]
                items.[smallest] <- temp
                idx <- smallest
            else
                keepGoing <- false

    member this.Insert(x: int) =
        items.Add x
        this.SwapUp(items.Count - 1)

    member this.ExtractMin() =
        let top = items.[0]
        items.[0] <- items.[items.Count - 1]
        items.RemoveAt(items.Count - 1)
        if items.Count > 0 then this.SwapDown(0)
        top

let heap = MinHeap()
[ 5; 3; 8; 1; 9; 2 ] |> List.iter heap.Insert
printfn "%d" (heap.ExtractMin())
printfn "%d" (heap.ExtractMin())
printfn "%d" (heap.ExtractMin())
