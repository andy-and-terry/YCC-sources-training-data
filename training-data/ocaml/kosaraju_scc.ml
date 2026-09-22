let build_reverse graph n =
  let rev = Array.make n [] in
  Array.iteri (fun u neighbors -> List.iter (fun v -> rev.(v) <- u :: rev.(v)) neighbors) graph;
  rev

let kosaraju_scc graph n =
  let visited = Array.make n false in
  let order = ref [] in
  let rec dfs1 u =
    visited.(u) <- true;
    List.iter (fun v -> if not visited.(v) then dfs1 v) graph.(u);
    order := u :: !order
  in
  for u = 0 to n - 1 do
    if not visited.(u) then dfs1 u
  done;

  let rev = build_reverse graph n in
  let assigned = Array.make n false in
  let components = ref [] in
  let rec dfs2 u component =
    assigned.(u) <- true;
    component := u :: !component;
    List.iter (fun v -> if not assigned.(v) then dfs2 v component) rev.(u)
  in
  List.iter
    (fun u ->
      if not assigned.(u) then begin
        let component = ref [] in
        dfs2 u component;
        components := !component :: !components
      end)
    !order;
  !components

let () =
  (* 0 -> 1 -> 2 -> 0 (cycle), 2 -> 3 -> 4 -> 3 (cycle) *)
  let graph = [| [ 1 ]; [ 2 ]; [ 0; 3 ]; [ 4 ]; [ 3 ] |] in
  let sccs = kosaraju_scc graph 5 in
  List.iter
    (fun comp ->
      List.iter (fun v -> Printf.printf "%d " v) comp;
      print_newline ())
    sccs
