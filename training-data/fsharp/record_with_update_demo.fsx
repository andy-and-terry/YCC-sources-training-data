type Employee = { Name: string; Salary: float; Department: string }

let alice = { Name = "Alice"; Salary = 60000.0; Department = "Engineering" }
let promoted = { alice with Salary = alice.Salary * 1.1 }
let transferred = { promoted with Department = "Research" }

printfn "%A" alice
printfn "%A" promoted
printfn "%A" transferred
