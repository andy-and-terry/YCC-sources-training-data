type union_find = { parent : int array }

let create n = { parent = Array.init n (fun i -> i) }

let rec find uf x = if uf.parent.(x) = x then x else find uf uf.parent.(x)

let union uf x y =
  let root_x = find uf x in
  let root_y = find uf y in
  if root_x <> root_y then uf.parent.(root_x) <- root_y

let () =
  let uf = create 5 in
  union uf 0 1;
  union uf 1 2;
  print_endline (string_of_bool (find uf 0 = find uf 2));
  print_endline (string_of_bool (find uf 0 = find uf 3))
