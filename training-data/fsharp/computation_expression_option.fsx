type OptionBuilder() =
    member _.Bind(x, f) = Option.bind f x
    member _.Return x = Some x

let opt = OptionBuilder()
let r = opt { let! a = Some 3
              let! b = Some 4
              return a * b }
printfn "%A" r
