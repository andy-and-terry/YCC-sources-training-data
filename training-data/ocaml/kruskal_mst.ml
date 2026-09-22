type edge = { src : int; dst : int; weight : int }

let find parent x =
  let rec go x = if parent.(x) = x then x else go parent.(x) in
  go x

let union parent rank x y =
  let root_x = find parent x in
  let root_y = find parent y in
  if root_x = root_y then false
  else begin
    if rank.(root_x) < rank.(root_y) then parent.(root_x) <- root_y
    else if rank.(root_x) > rank.(root_y) then parent.(root_y) <- root_x
    else begin
      parent.(root_y) <- root_x;
      rank.(root_x) <- rank.(root_x) + 1
    end;
    true
  end

let kruskal_mst num_vertices edges =
  let sorted = List.sort (fun a b -> compare a.weight b.weight) edges in
  let parent = Array.init num_vertices (fun i -> i) in
  let rank = Array.make num_vertices 0 in
  List.fold_left
    (fun (mst, total) e ->
      if union parent rank e.src e.dst then (e :: mst, total + e.weight)
      else (mst, total))
    ([], 0) sorted

let () =
  let edges =
    [
      { src = 0; dst = 1; weight = 4 };
      { src = 0; dst = 2; weight = 4 };
      { src = 1; dst = 2; weight = 2 };
      { src = 2; dst = 3; weight = 3 };
      { src = 3; dst = 4; weight = 2 };
      { src = 4; dst = 2; weight = 3 };
    ]
  in
  let mst, total = kruskal_mst 5 edges in
  List.iter (fun e -> Printf.printf "%d - %d : %d\n" e.src e.dst e.weight) (List.rev mst);
  Printf.printf "total: %d\n" total
