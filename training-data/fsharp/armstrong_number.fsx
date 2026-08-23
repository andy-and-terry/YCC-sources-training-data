let digits n =
    let rec go n acc = if n = 0 then acc else go (n / 10) (n % 10 :: acc)
    go n []

let isArmstrong n =
    let ds = digits n
    let power = List.length ds
    (ds |> List.sumBy (fun d -> pown d power)) = n

printfn "%b" (isArmstrong 153)
printfn "%b" (isArmstrong 154)
