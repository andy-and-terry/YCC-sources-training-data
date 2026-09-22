let bellman_ford n edges source =
  let dist = Array.make n max_int in
  dist.(source) <- 0;
  for _ = 1 to n - 1 do
    List.iter
      (fun (u, v, w) ->
        if dist.(u) <> max_int && dist.(u) + w < dist.(v) then dist.(v) <- dist.(u) + w)
      edges
  done;
  dist

let () =
  let edges = [ (0, 1, 4); (0, 2, 1); (2, 1, 2); (1, 3, 1); (2, 3, 5) ] in
  let dist = bellman_ford 4 edges 0 in
  Array.iteri (fun i d -> Printf.printf "dist[%d] = %d\n" i d) dist
