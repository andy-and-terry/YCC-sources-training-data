let plusOne (digits: int list) =
    let carry, result =
        List.foldBack (fun d (c, acc) -> let s = d + c in (s / 10, (s % 10) :: acc)) digits (1, [])
    if carry > 0 then carry :: result else result

printfn "%A" (plusOne [ 1; 2; 9 ]) // [1; 3; 0]
printfn "%A" (plusOne [ 9; 9 ])    // [1; 0; 0]
