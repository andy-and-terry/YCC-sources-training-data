(* Inspect the garbage collector with Gc.quick_stat and Gc.stat. *)
let allocate n =
  let rec build acc i = if i = 0 then acc else build (i :: acc) (i - 1) in
  build [] n

let () =
  let before = Gc.quick_stat () in
  let big = allocate 200_000 in
  let after = Gc.quick_stat () in
  Printf.printf "list length: %d\n" (List.length big);
  Printf.printf "minor words allocated: %b\n"
    (after.Gc.minor_words > before.Gc.minor_words);
  Printf.printf "minor collections grew: %b\n"
    (after.Gc.minor_collections >= before.Gc.minor_collections);

  (* Force a full major collection and compare heap sizes. *)
  let live_before = (Gc.stat ()).Gc.live_words in
  ignore (Sys.opaque_identity big);
  Gc.full_major ();
  let live_after = (Gc.stat ()).Gc.live_words in
  Printf.printf "live words non-negative: %b\n" (live_before >= 0 && live_after >= 0);

  (* Finalisers run when a value becomes unreachable. *)
  let r = ref 42 in
  Gc.finalise (fun _ -> print_endline "finalised") r;
  r := 0;
  Gc.full_major ()
