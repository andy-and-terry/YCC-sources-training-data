let area pts =
  let a = Array.of_list pts in
  let n = Array.length a in
  let s = ref 0.0 in
  for i = 0 to n - 1 do
    let x1, y1 = a.(i) and x2, y2 = a.((i + 1) mod n) in
    s := !s +. ((x1 *. y2) -. (x2 *. y1))
  done;
  abs_float !s /. 2.0

let () = Printf.printf "%.1f\n" (area [ (0., 0.); (4., 0.); (4., 3.); (0., 3.) ])
