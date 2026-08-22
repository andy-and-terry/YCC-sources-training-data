type shape =
  | Circle of float
  | Rectangle of float * float
  | Triangle of float * float

let area = function
  | Circle r -> Float.pi *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (b, h) -> 0.5 *. b *. h

let () =
  [ Circle 2.0; Rectangle (3.0, 4.0); Triangle (6.0, 2.0) ]
  |> List.iter (fun s -> Printf.printf "%.2f\n" (area s))
