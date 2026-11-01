type Person = { Name: string; Age: int }

let p = { Name = "Ann"; Age = 30 }
let older = { p with Age = p.Age + 1 }
printfn "%A" older
printfn "%b" (p = older)
