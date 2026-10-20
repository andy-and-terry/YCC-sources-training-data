type shape = Circle of float | Rect of float * float

let area = function
  | Circle r -> 3.14159 *. r *. r
  | Rect (w, h) -> w *. h

let () = Printf.printf "%.2f %.2f\n" (area (Circle 1.)) (area (Rect (2., 3.)))
