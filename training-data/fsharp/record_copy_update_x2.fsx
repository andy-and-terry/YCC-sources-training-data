type Person = { Name: string; Age: int }
let p = { Name = "Ann"; Age = 30 }
let q = { p with Age = 31 }
printfn "%A %A" p q
