let secant f a b =
  let a = ref a and b = ref b in
  for _ = 1 to 40 do
    let fa = f !a and fb = f !b in
    if fa <> fb then begin
      let c = !b -. (fb *. (!b -. !a) /. (fb -. fa)) in
      a := !b;
      b := c
    end
  done;
  !b

let () = Printf.printf "%.8f\n" (secant (fun x -> (x *. x) -. 2.) 1. 2.)
