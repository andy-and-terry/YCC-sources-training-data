let mutable counter = 0
for i in 1..5 do
    counter <- counter + i
printfn "%d" counter

let makeCounter () =
    let count = ref 0
    fun () ->
        count.Value <- count.Value + 1
        count.Value

let next = makeCounter ()
next () |> ignore
next () |> ignore
printfn "%d" (next ())

let swap (a: int ref) (b: int ref) =
    let t = a.Value
    a.Value <- b.Value
    b.Value <- t

let x, y = ref 1, ref 2
swap x y
printfn "%d %d" x.Value y.Value

let mutable i = 0
while i < 3 do
    printf "%d " i
    i <- i + 1
printfn ""
