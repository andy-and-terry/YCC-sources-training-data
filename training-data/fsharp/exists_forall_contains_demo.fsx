let nums = [ 2; 4; 6; 7 ]

printfn "%b" (nums |> List.exists (fun n -> n % 2 = 1))
printfn "%b" (nums |> List.forall (fun n -> n % 2 = 0))
printfn "%b" (nums |> List.contains 4)
printfn "%b" ([] |> List.forall (fun (n: int) -> n > 0))
printfn "%b" (Seq.exists ((=) 'z') "buzz")
printfn "%b" (Array.forall (fun s -> String.length s > 1) [| "ab"; "cd" |])
