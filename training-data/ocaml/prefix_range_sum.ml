let make_prefix values =
  let n = Array.length values in
  let p = Array.make (n + 1) 0 in
  Array.iteri (fun i v -> p.(i + 1) <- p.(i) + v) values;
  p

let query p lo hi = p.(hi) - p.(lo)

let () =
  let p = make_prefix [| 3; 1; 4; 1; 5; 9; 2; 6 |] in
  Printf.printf "%d\n" (query p 2 5)
