let escape cr ci =
  let rec go zr zi n =
    if n = 30 || zr *. zr +. zi *. zi >= 4.0 then n
    else go (zr *. zr -. zi *. zi +. cr) (2.0 *. zr *. zi +. ci) (n + 1)
  in
  go 0.0 0.0 0

let () =
  for yi = -5 to 5 do
    for xi = -40 to 12 do
      print_char (if escape (float xi /. 20.) (float yi /. 5.) = 30 then '#' else '.')
    done;
    print_newline ()
  done
