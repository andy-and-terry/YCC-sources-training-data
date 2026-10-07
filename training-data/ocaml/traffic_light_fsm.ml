(* A finite state machine modeled directly as a variant type, with the
   transition function expressed purely through pattern matching. *)
type state = Red | Green | Yellow

let name = function Red -> "red" | Green -> "green" | Yellow -> "yellow"

let next = function
  | Red -> Green
  | Green -> Yellow
  | Yellow -> Red

let () =
  let rec run state steps =
    if steps > 0 then (
      print_endline (name state);
      run (next state) (steps - 1))
  in
  run Red 6
