(* OCaml usually reaches for pattern matching over a variant instead of the
   classic visitor double-dispatch, but this shows the GoF shape: separate
   "visitor" functions operate on a closed set of shapes without the shape
   type itself needing to know about area or perimeter. *)
type shape =
  | Circle of float
  | Rectangle of float * float

let accept_area = function
  | Circle r -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h

let accept_perimeter = function
  | Circle r -> 2.0 *. 3.14159 *. r
  | Rectangle (w, h) -> 2.0 *. (w +. h)

let () =
  let shapes = [ Circle 2.0; Rectangle (3.0, 4.0) ] in
  List.iter
    (fun s -> Printf.printf "area=%.2f perimeter=%.2f\n" (accept_area s) (accept_perimeter s))
    shapes
