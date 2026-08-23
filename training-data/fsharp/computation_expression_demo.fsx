let safeDivide a b =
    if b = 0 then None else Some (a / b)

let safeDivideChain a b c =
    option {
        let! result = safeDivide a b
        let! final = safeDivide result c
        return final
    }

printfn "%A" (safeDivideChain 100 5 2)
printfn "%A" (safeDivideChain 100 0 2)
