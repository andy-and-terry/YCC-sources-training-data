type segment_tree = { tree : int array; n : int }

let rec build st arr node start stop =
  if start = stop then st.tree.(node) <- arr.(start)
  else begin
    let mid = (start + stop) / 2 in
    build st arr (2 * node) start mid;
    build st arr ((2 * node) + 1) (mid + 1) stop;
    st.tree.(node) <- st.tree.(2 * node) + st.tree.((2 * node) + 1)
  end

let create arr =
  let n = Array.length arr in
  let st = { tree = Array.make (4 * n) 0; n } in
  build st arr 1 0 (n - 1);
  st

let rec query st node start stop l r =
  if r < start || stop < l then 0
  else if l <= start && stop <= r then st.tree.(node)
  else
    let mid = (start + stop) / 2 in
    query st (2 * node) start mid l r + query st ((2 * node) + 1) (mid + 1) stop l r

let range_sum st l r = query st 1 0 (st.n - 1) l r

let () =
  let st = create [| 1; 3; 5; 7; 9; 11 |] in
  Printf.printf "%d\n" (range_sum st 1 3);
  Printf.printf "%d\n" (range_sum st 0 5)
