let rotate_left arr k =
  let n = Array.length arr in
  if n = 0 then arr
  else
    let k = k mod n in
    Array.init n (fun i -> arr.((i + k) mod n))

let () =
  let arr = [| 1; 2; 3; 4; 5 |] in
  let rotated = rotate_left arr 2 in
  Array.iter (Printf.printf "%d ") rotated;
  print_newline ();
  Printf.printf "all positive: %b\n" (Array.for_all (fun x -> x > 0) rotated);
  Printf.printf "has 4: %b\n" (Array.exists (( = ) 4) rotated);
  let first_half = Array.sub rotated 0 2 in
  Array.iter (Printf.printf "%d ") first_half;
  print_newline ()
