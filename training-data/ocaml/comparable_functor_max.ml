module type ORDERED = sig
  type t
  val compare : t -> t -> int
  val to_string : t -> string
end

module MakeMax (O : ORDERED) = struct
  let max_of = function
    | [] -> None
    | x :: rest ->
        Some (List.fold_left (fun m y -> if O.compare y m > 0 then y else m) x rest)

  let show l =
    match max_of l with Some m -> O.to_string m | None -> "(empty)"
end

module IntMax = MakeMax (struct
  type t = int
  let compare = compare
  let to_string = string_of_int
end)

module StrMax = MakeMax (struct
  type t = string
  let compare = compare
  let to_string s = s
end)

let () =
  print_endline (IntMax.show [ 3; 17; 5 ]);
  print_endline (StrMax.show [ "pear"; "zebra"; "apple" ]);
  print_endline (IntMax.show [])
