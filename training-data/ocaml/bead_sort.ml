(* Bead (gravity) sort. *)
let count p l = List.length (List.filter p l)
let bead_sort nums =
  let mx = List.fold_left max 0 nums in
  let cols = List.init mx (fun i -> count (fun n -> n > i) nums) in
  List.rev (List.init (List.length nums) (fun r -> count (fun c -> c > r) cols))

let () = List.iter (Printf.printf "%d ") (bead_sort [5; 3; 1; 4; 2]); print_newline ()
