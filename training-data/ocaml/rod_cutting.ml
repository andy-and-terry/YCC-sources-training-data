let rod_cutting prices length =
  let dp = Array.make (length + 1) 0 in
  for len = 1 to length do
    let best = ref min_int in
    for cut = 1 to len do
      let candidate = prices.(cut - 1) + dp.(len - cut) in
      if candidate > !best then best := candidate
    done;
    dp.(len) <- !best
  done;
  dp.(length)

let () =
  let prices = [| 1; 5; 8; 9; 10; 17; 17; 20 |] in
  Printf.printf "%d\n" (rod_cutting prices 8)
