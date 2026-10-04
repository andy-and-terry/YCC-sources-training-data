let rec naturals_from n () = Seq.Cons (n, naturals_from (n + 1))

let rec take n seq () =
  if n = 0 then Seq.Nil
  else
    match seq () with
    | Seq.Nil -> Seq.Nil
    | Seq.Cons (x, rest) -> Seq.Cons (x, take (n - 1) rest)

let () =
  naturals_from 1
  |> Seq.filter (fun x -> x mod 3 = 0)
  |> Seq.map (fun x -> x * x)
  |> take 5
  |> Seq.iter (Printf.printf "%d ");
  print_newline ();
  let lst = List.to_seq [ 1; 2; 3; 4 ] |> Seq.map (fun x -> x + 1) |> List.of_seq in
  List.iter (Printf.printf "%d ") lst;
  print_newline ()
