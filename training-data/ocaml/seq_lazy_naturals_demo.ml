let rec from n () = Seq.Cons (n, from (n + 1))

let () =
  from 1
  |> Seq.filter (fun x -> x mod 3 = 0)
  |> Seq.map (fun x -> x * x)
  |> Seq.take 5
  |> Seq.iter (Printf.printf "%d ")
  |> print_newline
