type shape = Circle of float | Rectangle of float * float | Triangle of float * float * float

let area = function
  | Circle r -> Float.pi *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (a, b, c) ->
      let s = (a +. b +. c) /. 2.0 in
      sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))

let () =
  Printf.printf "%f\n" (area (Circle 4.0));
  Printf.printf "%f\n" (area (Rectangle (3.0, 5.0)))
