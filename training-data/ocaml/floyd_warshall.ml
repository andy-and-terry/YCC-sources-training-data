let inf = 1000000

let floyd_warshall n edges =
  let dist = Array.make_matrix n n inf in
  for i = 0 to n - 1 do
    dist.(i).(i) <- 0
  done;
  List.iter (fun (u, v, w) -> dist.(u).(v) <- w) edges;
  for k = 0 to n - 1 do
    for i = 0 to n - 1 do
      for j = 0 to n - 1 do
        if dist.(i).(k) + dist.(k).(j) < dist.(i).(j) then
          dist.(i).(j) <- dist.(i).(k) + dist.(k).(j)
      done
    done
  done;
  dist

let () =
  let edges = [ (0, 1, 3); (0, 2, 8); (1, 2, 2); (2, 0, 5); (2, 3, 1); (3, 1, 4) ] in
  let dist = floyd_warshall 4 edges in
  Array.iter
    (fun row ->
      Array.iter (fun d -> Printf.printf "%d " d) row;
      print_newline ())
    dist
