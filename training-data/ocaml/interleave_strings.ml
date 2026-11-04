let interleave parts =
  let longest = List.fold_left (fun m s -> max m (String.length s)) 0 parts in
  let buf = Buffer.create 16 in
  for i = 0 to longest - 1 do
    List.iter (fun s -> if i < String.length s then Buffer.add_char buf s.[i]) parts
  done;
  Buffer.contents buf

let () =
  print_endline (interleave [ "abc"; "12345" ]);
  print_endline (interleave [ "ab"; "cd"; "efg" ])
