let rec nats n () = Seq.Cons (n, nats (n + 1))

let () = Seq.take 5 (nats 1) |> Seq.iter (Printf.printf "%d ")
