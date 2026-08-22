type point = { x : float; y : float }

let add_points a b = { x = a.x +. b.x; y = a.y +. b.y }

let () =
  let p1 = { x = 1.0; y = 2.0 } in
  let p2 = { x = 3.0; y = 4.0 } in
  let p3 = add_points p1 p2 in
  Printf.printf "(%.1f, %.1f)\n" p3.x p3.y
