type LRUCache(capacity: int) =
    let map = System.Collections.Generic.Dictionary<int, int>()
    let order = System.Collections.Generic.List<int>()

    member this.Get(key: int) =
        if map.ContainsKey key then
            order.Remove key |> ignore
            order.Add key
            Some map.[key]
        else
            None

    member this.Put(key: int, value: int) =
        if map.ContainsKey key then order.Remove key |> ignore
        map.[key] <- value
        order.Add key
        if order.Count > capacity then
            let evict = order.[0]
            order.RemoveAt 0
            map.Remove evict |> ignore

let cache = LRUCache(2)
cache.Put(1, 1)
cache.Put(2, 2)
printfn "%A" (cache.Get 1)
cache.Put(3, 3)
printfn "%A" (cache.Get 2)
