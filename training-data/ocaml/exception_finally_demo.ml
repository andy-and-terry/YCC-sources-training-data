exception Invalid_input of string

let with_resource name f =
  Printf.printf "open %s\n" name;
  Fun.protect ~finally:(fun () -> Printf.printf "close %s\n" name) f

let check n = if n < 0 then raise (Invalid_input "negative") else n * 2

let () =
  let r = with_resource "a" (fun () -> check 21) in
  Printf.printf "result=%d\n" r;
  (try ignore (with_resource "b" (fun () -> check (-1)))
   with Invalid_input msg -> Printf.printf "caught: %s\n" msg);
  let v = try List.assoc "k" [ ("j", 1) ] with Not_found -> -1 in
  Printf.printf "v=%d\n" v;
  match int_of_string "12x" with
  | n -> Printf.printf "n=%d\n" n
  | exception Failure m -> Printf.printf "failure: %s\n" m
