let () =
  let n = 8 in
  for r = 0 to n - 1 do
    print_string (String.make (n - r - 1) ' ');
    for c = 0 to r do
      print_string (if r land c = c then "* " else "  ")
    done;
    print_newline ()
  done
