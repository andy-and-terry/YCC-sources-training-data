(* Polymorphic variants (backtick tags) don't need a single declared type:
   the compiler infers the least general row type that covers whichever
   tags a function actually pattern-matches on, and different functions
   can agree on the same tags without sharing a nominal type declaration. *)
let describe = function
  | `Circle r -> Printf.sprintf "circle with radius %.1f" r
  | `Rectangle (w, h) -> Printf.sprintf "rectangle %.1fx%.1f" w h
  | `Square s -> Printf.sprintf "square with side %.1f" s

let area = function
  | `Circle r -> Float.pi *. r *. r
  | `Rectangle (w, h) -> w *. h
  | `Square s -> s *. s

let () =
  let shapes = [ `Circle 2.0; `Rectangle (3.0, 4.0); `Square 5.0 ] in
  List.iter (fun s -> Printf.printf "%s -> %.2f\n" (describe s) (area s)) shapes
