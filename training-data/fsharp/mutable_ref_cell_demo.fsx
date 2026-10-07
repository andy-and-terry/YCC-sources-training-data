let counter = ref 0
let incr' () = counter.Value <- counter.Value + 1

for _ in 1 .. 5 do incr' ()
printfn "ref cell: %d" counter.Value

let mutable total = 0
for i in 1 .. 10 do total <- total + i
printfn "mutable: %d" total

let makeCounter () =
    let mutable n = 0
    let cell = ref 0
    fun () ->
        cell.Value <- cell.Value + 1
        cell.Value

let next = makeCounter ()
next () |> ignore
next () |> ignore
printfn "closure counter: %d" (next ())
