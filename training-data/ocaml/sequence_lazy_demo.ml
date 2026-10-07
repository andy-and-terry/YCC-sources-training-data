let rec naturals n () = Seq.Cons (n, naturals (n + 1))

let rec take n s () =
  if n = 0 then Seq.Nil
  else match s () with
    | Seq.Nil -> Seq.Nil
    | Seq.Cons (x, rest) -> Seq.Cons (x, take (n - 1) rest)

let () =
  naturals 1
  |> Seq.filter (fun x -> x mod 3 = 0)
  |> Seq.map (fun x -> x * x)
  |> take 5
  |> Seq.iter (fun x -> Printf.printf "%d " x);
  print_newline ()
