let with_resource name f =
  Printf.printf "open %s\n" name;
  Fun.protect ~finally:(fun () -> Printf.printf "close %s\n" name) f

let () =
  (try with_resource "db" (fun () -> failwith "boom")
   with Failure m -> Printf.printf "caught: %s\n" m);
  let v = with_resource "file" (fun () -> 42) in
  Printf.printf "value %d\n" v
