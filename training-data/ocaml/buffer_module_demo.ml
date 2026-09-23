let build_csv_row fields =
  let buf = Buffer.create 64 in
  List.iteri
    (fun i field ->
      if i > 0 then Buffer.add_char buf ',';
      Buffer.add_string buf field)
    fields;
  Buffer.contents buf

let () =
  print_endline (build_csv_row [ "name"; "age"; "city" ]);
  print_endline (build_csv_row [ "Alice"; "30"; "Paris" ])
