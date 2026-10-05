let rec naturals n () = Seq.Cons (n, naturals (n + 1))

let rec take n s () =
  if n = 0 then Seq.Nil
  else match s () with
    | Seq.Nil -> Seq.Nil
    | Seq.Cons (x, rest) -> Seq.Cons (x, take (n - 1) rest)

let () =
  let evens_squared =
    naturals 1
    |> Seq.filter (fun x -> x mod 2 = 0)
    |> Seq.map (fun x -> x * x)
  in
  take 5 evens_squared |> Seq.iter (Printf.printf "%d ");
  print_newline ()
