(* A module is already a single, statically-shared namespace, so the
   singleton pattern falls out for free: there is exactly one `Logger`
   module and its `messages` ref is the one shared instance, with no
   separate class or lazy-initialization check needed. *)
module Logger = struct
  let messages : string list ref = ref []

  let log msg = messages := msg :: !messages

  let all () = List.rev !messages
end

let () =
  Logger.log "first message";
  Logger.log "second message";
  List.iter print_endline (Logger.all ())
