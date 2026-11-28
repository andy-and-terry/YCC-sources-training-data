let secant f x0 x1 =
  let rec go n x0 x1 =
    let f0 = f x0 and f1 = f x1 in
    if n = 0 || f1 = f0 then x1
    else
      let next = x1 -. (f1 *. (x1 -. x0) /. (f1 -. f0)) in
      if abs_float (next -. x1) < 1e-12 then next else go (n - 1) x1 next
  in
  go 50 x0 x1

let () = Printf.printf "%.10f\n" (secant (fun x -> (x *. x) -. 2.) 1. 2.)
