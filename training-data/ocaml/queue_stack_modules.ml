let () =
  let q = Queue.create () in
  List.iter (fun x -> Queue.add x q) [ 1; 2; 3 ];
  let a = Queue.take q in
  Printf.printf "%d %d %d\n" a (Queue.length q) (Queue.peek q);
  let s = Stack.create () in
  List.iter (fun x -> Stack.push x s) [ 1; 2; 3 ];
  Printf.printf "%d %d %b\n" (Stack.pop s) (Stack.length s) (Stack.is_empty s);
  let bfs adj start =
    let seen = Hashtbl.create 8 and out = ref [] and q = Queue.create () in
    Queue.add start q;
    Hashtbl.add seen start ();
    while not (Queue.is_empty q) do
      let n = Queue.take q in
      out := n :: !out;
      List.iter (fun m -> if not (Hashtbl.mem seen m) then (Hashtbl.add seen m (); Queue.add m q)) (List.assoc n adj)
    done;
    List.rev !out
  in
  print_endline (String.concat "" (bfs [ ("a", [ "b"; "c" ]); ("b", [ "d" ]); ("c", [ "d" ]); ("d", []) ] "a"))
