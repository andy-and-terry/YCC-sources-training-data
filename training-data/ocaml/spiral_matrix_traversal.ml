let spiral_order matrix =
  let rows = Array.length matrix in
  if rows = 0 then []
  else begin
    let cols = Array.length matrix.(0) in
    let result = ref [] in
    let top = ref 0 and bottom = ref (rows - 1) in
    let left = ref 0 and right = ref (cols - 1) in
    while !top <= !bottom && !left <= !right do
      for c = !left to !right do
        result := matrix.(!top).(c) :: !result
      done;
      incr top;
      for r = !top to !bottom do
        result := matrix.(r).(!right) :: !result
      done;
      decr right;
      if !top <= !bottom then begin
        for c = !right downto !left do
          result := matrix.(!bottom).(c) :: !result
        done;
        decr bottom
      end;
      if !left <= !right then begin
        for r = !bottom downto !top do
          result := matrix.(r).(!left) :: !result
        done;
        incr left
      end
    done;
    List.rev !result
  end

let () =
  let m = [| [| 1; 2; 3 |]; [| 4; 5; 6 |]; [| 7; 8; 9 |] |] in
  List.iter (Printf.printf "%d ") (spiral_order m);
  print_newline ()
