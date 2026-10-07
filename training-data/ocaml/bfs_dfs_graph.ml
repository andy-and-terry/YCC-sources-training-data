module StringSet = Set.Make (String)

let bfs graph start =
  let visited = ref (StringSet.singleton start) in
  let queue = Queue.create () in
  Queue.push start queue;
  let order = ref [] in
  while not (Queue.is_empty queue) do
    let node = Queue.pop queue in
    order := node :: !order;
    List.iter
      (fun neighbor ->
        if not (StringSet.mem neighbor !visited) then begin
          visited := StringSet.add neighbor !visited;
          Queue.push neighbor queue
        end)
      (List.assoc node graph)
  done;
  List.rev !order

let dfs graph start =
  let visited = ref StringSet.empty in
  let order = ref [] in
  let rec visit node =
    if not (StringSet.mem node !visited) then begin
      visited := StringSet.add node !visited;
      order := node :: !order;
      List.iter visit (List.assoc node graph)
    end
  in
  visit start;
  List.rev !order

let () =
  let graph =
    [ ("a", [ "b"; "c" ]); ("b", [ "a"; "d" ]); ("c", [ "a"; "d" ]); ("d", [ "b"; "c"; "e" ]); ("e", [ "d" ]) ]
  in
  bfs graph "a" |> String.concat " " |> print_endline;
  dfs graph "a" |> String.concat " " |> print_endline
