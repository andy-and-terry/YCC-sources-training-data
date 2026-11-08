let area pts =
  let n = Array.length pts in
  let s = ref 0.0 in
  for i = 0 to n - 1 do
    let x1, y1 = pts.(i) and x2, y2 = pts.((i + 1) mod n) in
    s := !s +. (x1 *. y2) -. (x2 *. y1)
  done;
  abs_float !s /. 2.0

let () = Printf.printf "%g\n" (area [| (0., 0.); (4., 0.); (4., 3.); (0., 3.) |])
