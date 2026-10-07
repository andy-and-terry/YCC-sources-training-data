let bfs graph start =
  let visited = Hashtbl.create 16 in
  Hashtbl.replace visited start true;
  let queue = Queue.create () in
  Queue.push start queue;
  let order = ref [] in
  while not (Queue.is_empty queue) do
    let node = Queue.pop queue in
    order := node :: !order;
    let neighbors = try List.assoc node graph with Not_found -> [] in
    List.iter
      (fun neighbor ->
        if not (Hashtbl.mem visited neighbor) then begin
          Hashtbl.replace visited neighbor true;
          Queue.push neighbor queue
        end)
      neighbors
  done;
  List.rev !order

let rec dfs graph visited node order =
  if Hashtbl.mem visited node then order
  else begin
    Hashtbl.replace visited node true;
    let neighbors = try List.assoc node graph with Not_found -> [] in
    List.fold_left (fun acc n -> dfs graph visited n acc) (node :: order) neighbors
  end

let () =
  let graph =
    [ ("a", [ "b"; "c" ]); ("b", [ "d" ]); ("c", [ "d" ]); ("d", [ "e" ]); ("e", []) ]
  in
  let bfs_order = bfs graph "a" in
  Printf.printf "bfs: %s\n" (String.concat " " bfs_order);
  let dfs_order = List.rev (dfs graph (Hashtbl.create 16) "a" []) in
  Printf.printf "dfs: %s\n" (String.concat " " dfs_order)
