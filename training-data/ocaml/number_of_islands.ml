let rec sink grid r c =
  let rows = Array.length grid in
  let cols = Array.length grid.(0) in
  if r < 0 || r >= rows || c < 0 || c >= cols || grid.(r).(c) <> 1 then ()
  else begin
    grid.(r).(c) <- 0;
    sink grid (r - 1) c;
    sink grid (r + 1) c;
    sink grid r (c - 1);
    sink grid r (c + 1)
  end

let num_islands grid =
  let count = ref 0 in
  Array.iteri
    (fun r row ->
      Array.iteri
        (fun c cell -> if cell = 1 then begin
          incr count;
          sink grid r c
        end)
        row)
    grid;
  !count

let () =
  let grid =
    [| [| 1; 1; 0; 0 |]; [| 1; 1; 0; 0 |]; [| 0; 0; 1; 0 |]; [| 0; 0; 0; 1 |] |]
  in
  Printf.printf "%d\n" (num_islands grid)
