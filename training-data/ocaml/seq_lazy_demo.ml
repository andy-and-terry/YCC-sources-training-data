let rec naturals n () = Seq.Cons (n, naturals (n + 1))

let () =
  naturals 1
  |> Seq.filter (fun n -> n mod 3 = 0)
  |> Seq.map (fun n -> n * n)
  |> Seq.take 5
  |> List.of_seq
  |> List.iter (Printf.printf "%d ");
  print_newline ()
