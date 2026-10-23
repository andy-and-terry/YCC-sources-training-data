(* Lazy infinite sequences built with Seq.unfold and consumed with Seq.take. *)
let naturals = Seq.unfold (fun n -> Some (n, n + 1)) 0

let fibs = Seq.unfold (fun (a, b) -> Some (a, (b, a + b))) (0, 1)

let rec sieve s () =
  match s () with
  | Seq.Nil -> Seq.Nil
  | Seq.Cons (p, rest) ->
      Seq.Cons (p, sieve (Seq.filter (fun n -> n mod p <> 0) rest))

let print_seq name s =
  Printf.printf "%s:" name;
  Seq.iter (Printf.printf " %d") s;
  print_newline ()

let () =
  print_seq "naturals" (Seq.take 8 naturals);
  print_seq "fibs" (Seq.take 12 fibs);
  print_seq "even squares"
    (naturals |> Seq.map (fun n -> n * n) |> Seq.filter (fun n -> n mod 2 = 0) |> Seq.take 6);
  let primes = sieve (Seq.drop 2 naturals) in
  print_seq "primes" (Seq.take 10 primes);
  let total = Seq.fold_left ( + ) 0 (Seq.take 100 naturals) in
  Printf.printf "sum 0..99 = %d\n" total
