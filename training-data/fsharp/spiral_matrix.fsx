let spiral (m: int[][]) =
    let result = ResizeArray<int>()
    let mutable top = 0
    let mutable bottom = m.Length - 1
    let mutable left = 0
    let mutable right = m.[0].Length - 1
    while top <= bottom && left <= right do
        for j in left .. right do result.Add(m.[top].[j])
        top <- top + 1
        for i in top .. bottom do result.Add(m.[i].[right])
        right <- right - 1
        if top <= bottom then
            for j in right .. -1 .. left do result.Add(m.[bottom].[j])
            bottom <- bottom - 1
        if left <= right then
            for i in bottom .. -1 .. top do result.Add(m.[i].[left])
            left <- left + 1
    List.ofSeq result

printfn "%A" (spiral [| [| 1; 2; 3 |]; [| 4; 5; 6 |]; [| 7; 8; 9 |] |])
