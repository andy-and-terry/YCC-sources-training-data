let max_area h =
  let rec go lo hi best =
    if lo >= hi then best
    else
      let area = min h.(lo) h.(hi) * (hi - lo) in
      let best = max best area in
      if h.(lo) < h.(hi) then go (lo + 1) hi best else go lo (hi - 1) best
  in
  go 0 (Array.length h - 1) 0

let () = Printf.printf "%d\n" (max_area [| 1; 8; 6; 2; 5; 4; 8; 3; 7 |]) (* 49 *)
