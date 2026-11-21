(* Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits. *)
let digits n = List.init (String.length (string_of_int n)) (fun i -> Char.code (string_of_int n).[i] - 48)

let rec take k = function [] -> [] | x :: r -> if k = 0 then [] else x :: take (k - 1) r

let is_keith n =
  let k = List.length (digits n) in
  (* seq is kept newest-first *)
  let rec go seq =
    let last = List.hd seq in
    if last >= n then last = n
    else go (List.fold_left ( + ) 0 (take k seq) :: seq)
  in
  go (List.rev (digits n))

let () =
  for n = 10 to 1199 do
    if is_keith n then Printf.printf "%d " n
  done;
  print_newline ()
