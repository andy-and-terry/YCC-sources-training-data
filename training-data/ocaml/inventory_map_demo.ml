(* Map.Make builds a persistent, balanced-tree map keyed by any module
   with a `compare`; here it stores per-item counts for a small
   inventory, immutable at every update. *)
module Inventory = Map.Make (String)

let () =
  let inv = Inventory.empty in
  let inv = Inventory.add "apples" 10 inv in
  let inv = Inventory.add "bananas" 5 inv in
  let inv = Inventory.add "apples" 12 inv in
  Printf.printf "apples: %d\n" (Inventory.find "apples" inv);
  (match Inventory.find_opt "cherries" inv with
   | Some n -> Printf.printf "cherries: %d\n" n
   | None -> print_endline "cherries: out of stock");
  Inventory.iter (fun item count -> Printf.printf "%s -> %d\n" item count) inv
