(* A "command" is just a record of two closures capturing whatever state
   they need, so undo/redo needs no class hierarchy, only a stack of them. *)
type command = { execute : unit -> unit; undo : unit -> unit }

let total = ref 0

let make_add_command amount =
  { execute = (fun () -> total := !total + amount); undo = (fun () -> total := !total - amount) }

let history = ref []

let run cmd =
  cmd.execute ();
  history := cmd :: !history

let undo_last () =
  match !history with
  | [] -> ()
  | cmd :: rest ->
      cmd.undo ();
      history := rest

let () =
  run (make_add_command 5);
  run (make_add_command 10);
  Printf.printf "%d\n" !total;
  undo_last ();
  Printf.printf "%d\n" !total
