let a = [| 5; 3; 8; 1; 9; 2; 7; 4; 6; 0; 3; 5 |]
let bs = 4
let blk = Array.make 3 0
let () = Array.iteri (fun i v -> blk.(i / bs) <- blk.(i / bs) + v) a

let query l r =
  let rec go i acc =
    if i > r then acc
    else if i mod bs = 0 && i + bs - 1 <= r then go (i + bs) (acc + blk.(i / bs))
    else go (i + 1) (acc + a.(i))
  in
  go l 0

let () = Printf.printf "%d\n" (query 2 9)
