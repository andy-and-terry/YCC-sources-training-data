let floyd_warshall graph =
  let n = Array.length graph in
  let dist = Array.map Array.copy graph in
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
  let inf = 1000000 in
  let graph =
    [|
      [| 0; 3; inf; 7 |];
      [| 8; 0; 2; inf |];
      [| 5; inf; 0; 1 |];
      [| 2; inf; inf; 0 |];
    |]
  in
  let dist = floyd_warshall graph in
  Array.iter
    (fun row ->
      Array.iter (fun v -> Printf.printf "%d " v) row;
      print_newline ())
    dist
