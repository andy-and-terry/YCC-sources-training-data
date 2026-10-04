let next_row row =
  let shifted = 0 :: row and padded = row @ [ 0 ] in
  List.map2 ( + ) shifted padded

let () =
  let row = ref [ 1 ] in
  for _ = 1 to 6 do
    print_endline (String.concat " " (List.map string_of_int !row));
    row := next_row !row
  done
