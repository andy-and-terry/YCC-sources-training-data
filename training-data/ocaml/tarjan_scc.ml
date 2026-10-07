let tarjan_scc n adj =
  let index = Array.make n (-1) in
  let lowlink = Array.make n 0 in
  let on_stack = Array.make n false in
  let stack = ref [] in
  let counter = ref 0 in
  let sccs = ref [] in

  let rec strong_connect v =
    index.(v) <- !counter;
    lowlink.(v) <- !counter;
    incr counter;
    stack := v :: !stack;
    on_stack.(v) <- true;
    List.iter
      (fun w ->
        if index.(w) = -1 then begin
          strong_connect w;
          lowlink.(v) <- min lowlink.(v) lowlink.(w)
        end else if on_stack.(w) then
          lowlink.(v) <- min lowlink.(v) index.(w))
      adj.(v);
    if lowlink.(v) = index.(v) then begin
      let component = ref [] in
      let continue_ = ref true in
      while !continue_ do
        match !stack with
        | w :: rest ->
            stack := rest;
            on_stack.(w) <- false;
            component := w :: !component;
            if w = v then continue_ := false
        | [] -> continue_ := false
      done;
      sccs := !component :: !sccs
    end
  in
  for v = 0 to n - 1 do
    if index.(v) = -1 then strong_connect v
  done;
  !sccs

let () =
  let adj = [| [ 1 ]; [ 2 ]; [ 0 ]; [ 1; 2; 4 ]; [ 3; 5 ]; [ 2; 6 ]; [ 5 ] |] in
  let sccs = tarjan_scc 7 adj in
  List.iter
    (fun comp ->
      List.iter (Printf.printf "%d ") comp;
      print_newline ())
    sccs
