type ResultBuilder() =
    member _.Bind(r, f) = Result.bind f r
    member _.Return(x) = Ok x
let result = ResultBuilder()

let r = result {
    let! a = Ok 1
    let! b = Ok 2
    return a + b
}
printfn "%A" r
