let climb_stairs n =
  if n <= 2 then n
  else begin
    let a = ref 1 and b = ref 2 in
    for _ = 3 to n do
      let c = !a + !b in
      a := !b;
      b := c
    done;
    !b
  end

let () =
  Printf.printf "%d\n" (climb_stairs 5);
  Printf.printf "%d\n" (climb_stairs 10)
