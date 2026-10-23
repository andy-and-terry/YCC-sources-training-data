(* Weak arrays hold references that the GC may clear once nothing else
   points at the value. *)
let () =
  let w : string Weak.t = Weak.create 3 in
  let keep = String.make 5 'a' in
  Weak.set w 0 (Some keep);
  Weak.set w 1 (Some (String.make 5 'b'));
  Weak.set w 2 None;

  Printf.printf "length: %d\n" (Weak.length w);
  Printf.printf "slot 0 set: %b\n" (Weak.check w 0);
  Printf.printf "slot 2 set: %b\n" (Weak.check w 2);

  (* The only strong reference to slot 1 is gone; a full collection may
     clear it. The kept value stays alive. *)
  Gc.full_major ();
  (match Weak.get w 0 with
   | Some s -> Printf.printf "slot 0 still holds %s\n" s
   | None -> print_endline "slot 0 cleared");
  Printf.printf "keep is still reachable: %d chars\n" (String.length keep);

  (* A weak hash set interns values without preventing their collection. *)
  let module W = Weak.Make (struct
    type t = string
    let equal = String.equal
    let hash = Hashtbl.hash
  end) in
  let set = W.create 8 in
  let a = W.merge set (String.make 3 'x') in
  let b = W.merge set (String.make 3 'x') in
  Printf.printf "interned physically equal: %b\n" (a == b)
