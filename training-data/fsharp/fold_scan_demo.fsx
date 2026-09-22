let numbers = [ 1; 2; 3; 4; 5 ]

let total = List.fold (fun acc x -> acc + x) 0 numbers
let running = List.scan (fun acc x -> acc + x) 0 numbers
let product = List.fold (fun acc x -> acc * x) 1 numbers

printfn "%d" total
printfn "%A" running
printfn "%d" product
