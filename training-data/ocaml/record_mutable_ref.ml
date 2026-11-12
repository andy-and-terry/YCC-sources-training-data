type acc = { mutable total : int }
let () =
  let a = { total = 0 } in
  List.iter (fun x -> a.total <- a.total + x) [1; 2; 3];
  let r = ref 10 in
  r := !r * 2;
  Printf.printf "%d %d\n" a.total !r
