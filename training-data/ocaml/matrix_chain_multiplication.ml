let matrix_chain_order dims =
  let n = Array.length dims - 1 in
  let dp = Array.make_matrix n n 0 in
  for len = 2 to n do
    for i = 0 to n - len do
      let j = i + len - 1 in
      dp.(i).(j) <- max_int;
      for k = i to j - 1 do
        let cost = dp.(i).(k) + dp.(k + 1).(j) + (dims.(i) * dims.(k + 1) * dims.(j + 1)) in
        if cost < dp.(i).(j) then dp.(i).(j) <- cost
      done
    done
  done;
  dp.(0).(n - 1)

let () =
  Printf.printf "%d\n" (matrix_chain_order [| 40; 20; 30; 10; 30 |])
