let size = 64

let hash1 s = String.fold_left (fun h c -> (h * 31 + Char.code c) mod size) 0 s
let hash2 s = String.fold_left (fun h c -> (h * 17 + Char.code c + 7) mod size) 0 s

let add bits s =
  bits.(hash1 s) <- true;
  bits.(hash2 s) <- true

let might_contain bits s = bits.(hash1 s) && bits.(hash2 s)

let () =
  let bits = Array.make size false in
  add bits "apple";
  add bits "banana";
  Printf.printf "%b\n" (might_contain bits "apple");
  Printf.printf "%b\n" (might_contain bits "cherry")
