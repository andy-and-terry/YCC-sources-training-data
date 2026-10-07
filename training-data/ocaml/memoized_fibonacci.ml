let memo : (int, int) Hashtbl.t = Hashtbl.create 16

let rec fib n =
  match Hashtbl.find_opt memo n with
  | Some result -> result
  | None ->
      let result = if n < 2 then n else fib (n - 1) + fib (n - 2) in
      Hashtbl.add memo n result;
      result

let () =
  List.iter (fun n -> Printf.printf "%d " (fib n)) [ 0; 1; 2; 5; 10; 30 ];
  print_newline ()
