let swap a i j =
  let t = a.(i) in
  a.(i) <- a.(j);
  a.(j) <- t

let reverse_in_place a =
  let n = Array.length a in
  for i = 0 to (n / 2) - 1 do
    swap a i (n - 1 - i)
  done

let print_array a =
  Array.iter (Printf.printf "%d ") a;
  print_newline ()

let () =
  let a = [| 1; 2; 3; 4; 5 |] in
  reverse_in_place a;
  print_array a;
  let b = Array.copy a in
  b.(0) <- 100;
  print_array a;
  print_array b;
  let squares = Array.init 6 (fun i -> i * i) in
  print_array squares;
  print_array (Array.sub squares 2 3);
  Array.sort (fun x y -> compare y x) squares;
  print_array squares
