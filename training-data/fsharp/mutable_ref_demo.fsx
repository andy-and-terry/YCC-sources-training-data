let mutable counter = 0
for _ in 1 .. 5 do
    counter <- counter + 2
printfn "counter = %d" counter

let total = ref 0
[ 1; 2; 3 ] |> List.iter (fun x -> total.Value <- total.Value + x)
printfn "total = %d" total.Value

let makeCounter () =
    let count = ref 0
    fun () ->
        count.Value <- count.Value + 1
        count.Value

let next = makeCounter ()
printfn "%d %d %d" (next ()) (next ()) (next ())

let arr = [| 1; 2; 3 |]
arr.[1] <- 20
printfn "%A" arr
