(* `type ... = ..` declares an open, extensible variant type; new
   constructors can be added to it later with `+=`, which is how
   OCaml's built-in `exception` type itself works under the hood. *)
type animal_sound = ..

type animal_sound += Bark
type animal_sound += Meow
type animal_sound += Custom of string

let describe sound =
  match sound with
  | Bark -> "Woof!"
  | Meow -> "Meow!"
  | Custom s -> s
  | _ -> "..."

let () =
  List.iter
    (fun sound -> print_endline (describe sound))
    [ Bark; Meow; Custom "Squawk!" ]
