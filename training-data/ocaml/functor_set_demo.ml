module type ORDERED = sig
  type t
  val compare : t -> t -> int
end

(* A functor parameterized over any ORDERED module produces a full
   sorted-set module for that element type, keeping the underlying
   representation (a sorted, duplicate-free list) private to the
   generated module. *)
module MakeSet (Ord : ORDERED) = struct
  type elt = Ord.t
  type t = elt list

  let empty = []

  let rec add x = function
    | [] -> [ x ]
    | y :: rest ->
      let c = Ord.compare x y in
      if c = 0 then y :: rest
      else if c < 0 then x :: y :: rest
      else y :: add x rest

  let mem x = List.exists (fun y -> Ord.compare x y = 0)

  let to_list s = s
end

module IntSet = MakeSet (struct
  type t = int
  let compare = Stdlib.compare
end)

let () =
  let s = List.fold_left (fun acc x -> IntSet.add x acc) IntSet.empty [ 5; 3; 5; 1; 4; 3 ] in
  IntSet.to_list s |> List.map string_of_int |> String.concat " " |> print_endline;
  Printf.printf "contains 4: %b\n" (IntSet.mem 4 s);
  Printf.printf "contains 9: %b\n" (IntSet.mem 9 s)
