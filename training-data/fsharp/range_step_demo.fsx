// Range expressions with steps, characters, and descending order.
printfn "%A" [ 1 .. 5 ]
printfn "%A" [ 0 .. 3 .. 12 ]
printfn "%A" [ 10 .. -2 .. 0 ]
printfn "%A" [ 'a' .. 'f' ]
printfn "%A" [ 0.0 .. 0.25 .. 1.0 ]

let evens = seq { 0 .. 2 .. 20 }
printfn "%d" (Seq.sum evens)

// Slicing with ranges
let arr = [| 10; 20; 30; 40; 50 |]
printfn "%A" arr.[1..3]
printfn "%A" arr.[..1]
printfn "%A" arr.[3..]

for i in 3 .. -1 .. 1 do
    printf "%d " i
printfn ""
