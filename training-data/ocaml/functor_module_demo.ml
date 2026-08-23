module type COMPARABLE = sig
  type t
  val compare : t -> t -> int
end

module MakeSorter (C : COMPARABLE) = struct
  let sort lst = List.sort C.compare lst
end

module IntComparable = struct
  type t = int
  let compare = Stdlib.compare
end

module IntSorter = MakeSorter (IntComparable)

let () =
  IntSorter.sort [ 5; 3; 8; 1 ] |> List.map string_of_int |> String.concat " " |> print_endline
