let mutable counter = 0
for _ in 1 .. 5 do
    counter <- counter + 1
printfn "counter = %d" counter

let total = ref 0
[ 1; 2; 3; 4 ] |> List.iter (fun n -> total.Value <- total.Value + n)
printfn "total = %d" total.Value

let makeCounter () =
    let mutable n = 0
    let next () =
        n <- n + 1
        n
    next

let c1 = makeCounter ()
c1 () |> ignore
c1 () |> ignore
printfn "c1 = %d" (c1 ())

let swap (a: int ref) (b: int ref) =
    let tmp = a.Value
    a.Value <- b.Value
    b.Value <- tmp

let x, y = ref 1, ref 2
swap x y
printfn "x=%d y=%d" x.Value y.Value
