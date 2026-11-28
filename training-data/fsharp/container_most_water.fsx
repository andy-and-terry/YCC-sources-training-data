let maxArea (h: int[]) =
    let rec go lo hi best =
        if lo >= hi then best
        else
            let best' = max best (min h.[lo] h.[hi] * (hi - lo))
            if h.[lo] < h.[hi] then go (lo + 1) hi best' else go lo (hi - 1) best'
    go 0 (h.Length - 1) 0

printfn "%d" (maxArea [| 1; 8; 6; 2; 5; 4; 8; 3; 7 |]) // 49
