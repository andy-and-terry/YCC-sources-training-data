module StringSet = Set.Make (String)

let topo_sort graph =
  let visited = ref StringSet.empty in
  let order = ref [] in
  let rec visit node =
    if not (StringSet.mem node !visited) then (
      visited := StringSet.add node !visited;
      (try List.iter visit (List.assoc node graph) with Not_found -> ());
      order := node :: !order)
  in
  List.iter (fun (node, _) -> visit node) graph;
  !order

let () =
  let graph = [ ("a", [ "b"; "c" ]); ("b", [ "d" ]); ("c", [ "d" ]); ("d", []) ] in
  topo_sort graph |> String.concat " " |> print_endline
