let reverse_bits ?(width = 8) v =
  let rec go k v acc =
    if k = 0 then acc else go (k - 1) (v lsr 1) ((acc lsl 1) lor (v land 1))
  in
  go width v 0

let () =
  List.iter (fun v -> Printf.printf "%d %d\n" v (reverse_bits v)) [ 1; 6; 13; 128 ]
(* 128 96 176 1 *)
