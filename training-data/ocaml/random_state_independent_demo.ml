(* Random.State gives independent, reproducible generators, so separate
   components do not disturb each other's sequence. *)
let take st n bound = List.init n (fun _ -> Random.State.int st bound)

let () =
  let a = Random.State.make [| 42 |] in
  let b = Random.State.make [| 42 |] in
  let c = Random.State.make [| 7 |] in
  let la = take a 6 100 and lb = take b 6 100 and lc = take c 6 100 in
  let show l = String.concat " " (List.map string_of_int l) in
  Printf.printf "same seed equal:      %b\n" (la = lb);
  Printf.printf "different seed equal: %b\n" (la = lc);
  Printf.printf "seed 42: %s\n" (show la);

  (* Copying a state snapshots the stream at that point. *)
  let snap = Random.State.copy a in
  let next1 = Random.State.int a 1000 in
  let next2 = Random.State.int snap 1000 in
  Printf.printf "copy continues identically: %b\n" (next1 = next2);

  (* Other draw types *)
  let f = Random.State.float a 1.0 in
  Printf.printf "float in range: %b\n" (f >= 0.0 && f < 1.0);
  Printf.printf "bool: %b\n" (Random.State.bool a || true);

  (* Fisher-Yates shuffle driven by an explicit state *)
  let arr = Array.init 8 (fun i -> i) in
  for i = Array.length arr - 1 downto 1 do
    let j = Random.State.int c (i + 1) in
    let t = arr.(i) in
    arr.(i) <- arr.(j);
    arr.(j) <- t
  done;
  print_endline (show (Array.to_list arr))
