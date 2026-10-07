let prim_mst graph =
  let n = Array.length graph in
  let in_mst = Array.make n false in
  let key = Array.make n max_int in
  key.(0) <- 0;
  let total = ref 0 in
  for _ = 0 to n - 1 do
    let u = ref (-1) in
    for v = 0 to n - 1 do
      if (not in_mst.(v)) && (!u = -1 || key.(v) < key.(!u)) then u := v
    done;
    in_mst.(!u) <- true;
    total := !total + key.(!u);
    for v = 0 to n - 1 do
      let w = graph.(!u).(v) in
      if w <> 0 && (not in_mst.(v)) && w < key.(v) then key.(v) <- w
    done
  done;
  !total

let () =
  let graph =
    [|
      [| 0; 2; 0; 6; 0 |];
      [| 2; 0; 3; 8; 5 |];
      [| 0; 3; 0; 0; 7 |];
      [| 6; 8; 0; 0; 9 |];
      [| 0; 5; 7; 9; 0 |];
    |]
  in
  Printf.printf "%d\n" (prim_mst graph)
