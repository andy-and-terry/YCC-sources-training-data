(* Leyland numbers: x^y + y^x for x >= y >= 2. *)
let rec ipow b e = if e = 0 then 1 else b * ipow b (e - 1)

let () =
  for x = 2 to 4 do
    for y = 2 to x do
      Printf.printf "%d " (ipow x y + ipow y x)
    done
  done;
  print_newline ()
