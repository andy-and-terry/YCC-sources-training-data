(* Greedy sequence whose pairwise sums are all distinct. *)
let () =
  let seq = ref [] and sums = Hashtbl.create 64 in
  let cand = ref 1 in
  while List.length !seq < 8 do
    let fresh = List.map (fun x -> x + !cand) (!seq @ [ !cand ]) in
    let distinct = List.length (List.sort_uniq compare fresh) = List.length fresh in
    if distinct && not (List.exists (Hashtbl.mem sums) fresh) then begin
      seq := !seq @ [ !cand ];
      List.iter (fun s -> Hashtbl.replace sums s ()) fresh
    end;
    incr cand
  done;
  List.iter (Printf.printf "%d ") !seq;
  print_newline ()
