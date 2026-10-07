exception Boom of string

let with_resource name f =
  Printf.printf "open %s\n" name;
  Fun.protect
    ~finally:(fun () -> Printf.printf "close %s\n" name)
    (fun () -> f name)

let () =
  let r = with_resource "a" (fun n -> String.length n) in
  Printf.printf "result %d\n" r;
  (try ignore (with_resource "b" (fun _ -> raise (Boom "failed in b")))
   with Boom msg -> Printf.printf "caught: %s\n" msg);
  let result = try Ok (int_of_string "12x") with Failure m -> Error m in
  (match result with
   | Ok n -> Printf.printf "%d\n" n
   | Error m -> Printf.printf "error: %s\n" m);
  Fun.protect ~finally:(fun () -> print_endline "cleanup done") (fun () -> print_endline "working")
