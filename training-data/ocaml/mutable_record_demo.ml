type counter = { name : string; mutable count : int; mutable history : int list }

let make name = { name; count = 0; history = [] }

let incr_by c n =
  c.history <- c.count :: c.history;
  c.count <- c.count + n

let undo c =
  match c.history with
  | [] -> ()
  | prev :: rest ->
      c.count <- prev;
      c.history <- rest

let () =
  let c = make "clicks" in
  incr_by c 5;
  incr_by c 3;
  Printf.printf "%s = %d\n" c.name c.count;
  undo c;
  Printf.printf "after undo = %d\n" c.count;
  let r = ref 10 in
  r := !r * 2;
  incr r;
  Printf.printf "ref = %d\n" !r;
  let copy = { c with name = "copy" } in
  copy.count <- 99;
  Printf.printf "%d vs %d\n" c.count copy.count
