module Vec = struct
  type t = { x : float; y : float }

  let make x y = { x; y }
  let add a b = { x = a.x +. b.x; y = a.y +. b.y }
  let scale k a = { x = k *. a.x; y = k *. a.y }
  let norm a = sqrt ((a.x *. a.x) +. (a.y *. a.y))
end

let () =
  let open Vec in
  let v = add (make 1. 2.) (scale 2. (make 1. 1.)) in
  Printf.printf "(%.1f, %.1f) norm=%.3f\n" v.x v.y (norm v);
  let n = Vec.(norm (make 3. 4.)) in
  Printf.printf "norm=%.1f\n" n;
  let module L = List in
  Printf.printf "%d\n" (L.length [ 1; 2; 3 ])
