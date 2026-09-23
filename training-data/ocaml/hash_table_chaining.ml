(* A minimal hash table built from scratch: an array of buckets, each
   bucket an association list, with a hand-rolled hash function and
   collisions resolved by chaining. *)
type 'a hash_table = { mutable buckets : (string * 'a) list array }

let create size = { buckets = Array.make size [] }

let hash_index table key =
  let h = String.fold_left (fun acc c -> (acc * 31) + Char.code c) 0 key in
  abs h mod Array.length table.buckets

let add table key value =
  let i = hash_index table key in
  let without_key = List.filter (fun (k, _) -> k <> key) table.buckets.(i) in
  table.buckets.(i) <- (key, value) :: without_key

let find table key =
  let i = hash_index table key in
  List.assoc_opt key table.buckets.(i)

let () =
  let table = create 8 in
  add table "apple" 3;
  add table "banana" 5;
  add table "cherry" 7;
  add table "apple" 4;
  List.iter
    (fun key ->
      match find table key with
      | Some v -> Printf.printf "%s -> %d\n" key v
      | None -> Printf.printf "%s -> not found\n" key)
    [ "apple"; "banana"; "cherry"; "durian" ]
