module type ORD = sig type t val compare : t -> t -> int end

module MakeSet (O : ORD) = struct
  type t = O.t list
  let empty = []
  let rec add x = function
    | [] -> [x]
    | h :: tl as l ->
      let c = O.compare x h in
      if c = 0 then l else if c < 0 then x :: l else h :: add x tl
  let to_list s = s
end

module IntSet = MakeSet (struct type t = int let compare = compare end)

let () =
  let s = List.fold_left (fun a x -> IntSet.add x a) IntSet.empty [3; 1; 2; 3] in
  List.iter (Printf.printf "%d ") (IntSet.to_list s);
  print_newline ()
