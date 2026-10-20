let rec naturals n () = Seq.Cons (n, naturals (n + 1))

let rec take n s () =
  if n = 0 then Seq.Nil else match s () with Seq.Nil -> Seq.Nil | Seq.Cons (x, r) -> Seq.Cons (x, take (n - 1) r)

let () =
  let evens = Seq.filter (fun x -> x mod 2 = 0) (naturals 1) in
  let first5 = List.of_seq (take 5 (Seq.map (fun x -> x * x) evens)) in
  print_endline (String.concat " " (List.map string_of_int first5));
  let l = lazy (print_endline "forced"; 42) in
  Printf.printf "%d %d\n" (Lazy.force l) (Lazy.force l);
  Seq.iter (Printf.printf "%d ") (take 3 (Seq.unfold (fun (a, b) -> Some (a, (b, a + b))) (0, 1)));
  print_newline ()
