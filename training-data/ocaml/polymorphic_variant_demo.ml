(* Polymorphic variants are written with a leading backtick and do not
   need to be declared under a named type first; a function can accept
   any variant that has at least the tags it pattern-matches on. *)
let area = function
  | `Circle r -> Float.pi *. r *. r
  | `Rectangle (w, h) -> w *. h

let describe shape =
  match shape with
  | `Circle r -> Printf.sprintf "circle area=%.2f" (area (`Circle r))
  | `Rectangle (w, h) -> Printf.sprintf "rectangle area=%.2f" (area (`Rectangle (w, h)))
  | `Triangle (b, h) -> Printf.sprintf "triangle area=%.2f" (0.5 *. b *. h)

let () =
  List.iter
    (fun shape -> print_endline (describe shape))
    [ `Circle 2.0; `Rectangle (3.0, 4.0); `Triangle (6.0, 2.0) ]
