type Point = { X: int; Y: int }

let p = { X = 1; Y = 2 }
let q = { p with Y = 10 }
printfn "%A %A %b" p q (p = q)
