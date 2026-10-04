let expensive =
  lazy
    (print_endline "computing...";
     List.fold_left ( + ) 0 (List.init 1000 (fun i -> i)))

type 'a stream = Cons of 'a * 'a stream Lazy.t

let rec from n = Cons (n, lazy (from (n + 1)))

let rec take n (Cons (x, rest)) =
  if n = 0 then [] else x :: take (n - 1) (Lazy.force rest)

let rec filter p (Cons (x, rest)) =
  if p x then Cons (x, lazy (filter p (Lazy.force rest)))
  else filter p (Lazy.force rest)

let () =
  print_endline "before first force";
  Printf.printf "%d\n" (Lazy.force expensive);
  Printf.printf "%d\n" (Lazy.force expensive);
  let evens = filter (fun n -> n mod 2 = 0) (from 1) in
  List.iter (Printf.printf "%d ") (take 6 evens);
  print_newline ()
