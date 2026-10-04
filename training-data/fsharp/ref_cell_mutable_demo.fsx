let mutable counter = 0
for _ in 1 .. 5 do
    counter <- counter + 2
printfn "counter = %d" counter

let total = ref 0
[ 1; 2; 3 ] |> List.iter (fun x -> total.Value <- total.Value + x)
printfn "total = %d" total.Value

// Closures cannot capture 'let mutable', but they can capture ref cells.
let makeCounter () =
    let count = ref 0
    fun () ->
        count.Value <- count.Value + 1
        count.Value

let next = makeCounter ()
printfn "%d %d %d" (next ()) (next ()) (next ())

type Node = { mutable Value: int; mutable Next: Node option }

let n2 = { Value = 2; Next = None }
let n1 = { Value = 1; Next = Some n2 }
n2.Value <- 20
printfn "%d -> %d" n1.Value (n1.Next.Value.Value)

let arr = [| 1; 2; 3 |]
arr.[1] <- 99
printfn "%A" arr
