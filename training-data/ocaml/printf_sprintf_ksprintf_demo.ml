let log level fmt = Printf.ksprintf (fun msg -> Printf.printf "[%s] %s\n" level msg) fmt

let () =
  log "INFO" "starting %s v%d.%d" "app" 1 4;
  log "WARN" "disk at %.1f%%" 91.5;
  let s = Printf.sprintf "%05d|%-5s|%5s|%x" 42 "ab" "cd" 255 in
  print_endline s;
  Printf.eprintf "this goes to stderr\n";
  let pad n = Printf.sprintf "%*d" 6 n in
  print_endline (pad 12);
  Printf.printf "%s\n" (String.concat " " (List.map (Printf.sprintf "<%d>") [ 1; 2; 3 ]))
