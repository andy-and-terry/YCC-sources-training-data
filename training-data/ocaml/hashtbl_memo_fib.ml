let memo = Hashtbl.create 64

let rec fib n =
  if n < 2 then n
  else match Hashtbl.find_opt memo n with
    | Some v -> v
    | None -> let v = fib (n - 1) + fib (n - 2) in Hashtbl.add memo n v; v

let () = Printf.printf "%d\n" (fib 60)
