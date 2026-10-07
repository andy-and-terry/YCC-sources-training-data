let fib_seq =
  Seq.unfold (fun (a, b) -> Some (a, (b, a + b))) (0, 1)

let collatz n =
  Seq.unfold
    (fun k -> if k = 0 then None else Some (k, if k = 1 then 0 else if k mod 2 = 0 then k / 2 else (3 * k) + 1))
    n

let () =
  fib_seq |> Seq.take 10 |> List.of_seq |> List.map string_of_int
  |> String.concat " " |> print_endline;
  collatz 6 |> List.of_seq |> List.map string_of_int |> String.concat " -> " |> print_endline;
  let squares_of_odds =
    Seq.ints 1 |> Seq.filter (fun n -> n land 1 = 1) |> Seq.map (fun n -> n * n) |> Seq.take 5
  in
  Seq.iter (Printf.printf "%d ") squares_of_odds;
  print_newline ();
  Printf.printf "sum = %d\n" (Seq.fold_left ( + ) 0 squares_of_odds)
