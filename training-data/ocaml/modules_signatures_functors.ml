module type STACK = sig
  type 'a t
  val empty : 'a t
  val push : 'a -> 'a t -> 'a t
  val pop : 'a t -> ('a * 'a t) option
end

module ListStack : STACK = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function [] -> None | x :: r -> Some (x, r)
end

module type ORDERED = sig
  type t
  val compare : t -> t -> int
end

module MakeMax (O : ORDERED) = struct
  let max_of = function [] -> None | x :: r -> Some (List.fold_left (fun a b -> if O.compare a b >= 0 then a else b) x r)
end

module IntMax = MakeMax (struct type t = int let compare = compare end)

let () =
  let s = ListStack.(push 2 (push 1 empty)) in
  (match ListStack.pop s with Some (x, _) -> Printf.printf "%d\n" x | None -> ());
  match IntMax.max_of [ 3; 9; 4 ] with Some m -> Printf.printf "%d\n" m | None -> ()
