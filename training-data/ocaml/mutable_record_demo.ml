type counter = { mutable count : int; name : string }

let incr_by c n = c.count <- c.count + n

let () =
  let c = { count = 0; name = "hits" } in
  incr_by c 3;
  incr_by c 4;
  Printf.printf "%s = %d\n" c.name c.count;
  let r = ref 10 in
  r := !r * 2;
  incr r;
  Printf.printf "ref = %d\n" !r
