type 'a stream = Cons of 'a * 'a stream Lazy.t

let rec from n = Cons (n, lazy (from (n + 1)))

let rec take k (Cons (x, rest)) =
  if k = 0 then [] else x :: take (k - 1) (Lazy.force rest)

let () = List.iter (Printf.printf "%d ") (take 6 (from 10)); print_newline ()
