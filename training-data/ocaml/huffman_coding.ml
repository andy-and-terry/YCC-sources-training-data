type huff_tree = Leaf of char * int | Node of huff_tree * huff_tree * int

let freq_of = function Leaf (_, f) -> f | Node (_, _, f) -> f

let rec insert_sorted trees t =
  match trees with
  | [] -> [ t ]
  | x :: rest -> if freq_of t <= freq_of x then t :: x :: rest else x :: insert_sorted rest t

let rec build_tree trees =
  match trees with
  | [ single ] -> single
  | a :: b :: rest ->
      let merged = Node (a, b, freq_of a + freq_of b) in
      build_tree (insert_sorted rest merged)
  | [] -> failwith "empty input"

let rec codes tree prefix acc =
  match tree with
  | Leaf (c, _) -> (c, if prefix = "" then "0" else prefix) :: acc
  | Node (l, r, _) -> codes l (prefix ^ "0") (codes r (prefix ^ "1") acc)

let () =
  let text = "abracadabra" in
  let freqs = Hashtbl.create 8 in
  String.iter
    (fun c ->
      let cur = try Hashtbl.find freqs c with Not_found -> 0 in
      Hashtbl.replace freqs c (cur + 1))
    text;
  let leaves = Hashtbl.fold (fun c f acc -> insert_sorted acc (Leaf (c, f))) freqs [] in
  let tree = build_tree leaves in
  let table = codes tree "" [] in
  List.iter (fun (c, code) -> Printf.printf "%c: %s\n" c code) table
