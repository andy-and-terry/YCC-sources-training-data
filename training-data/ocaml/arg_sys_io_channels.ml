let () =
  let tmp = Filename.temp_file "demo" ".txt" in
  let oc = open_out tmp in
  List.iter (fun l -> output_string oc (l ^ "\n")) [ "one"; "two"; "three" ];
  close_out oc;
  let ic = open_in tmp in
  let rec read acc = match input_line ic with l -> read (l :: acc) | exception End_of_file -> List.rev acc in
  let lines = read [] in
  close_in ic;
  Printf.printf "%d %s\n" (List.length lines) (String.concat "|" lines);
  Printf.printf "%b\n" (Sys.file_exists tmp);
  Sys.remove tmp;
  Printf.printf "%b %d\n" (Sys.file_exists tmp) (Array.length Sys.argv)
