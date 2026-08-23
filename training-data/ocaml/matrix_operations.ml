let transpose matrix =
  let rows = Array.length matrix in
  let cols = Array.length matrix.(0) in
  Array.init cols (fun c -> Array.init rows (fun r -> matrix.(r).(c)))

let multiply a b =
  let bt = transpose b in
  Array.map
    (fun row -> Array.map (fun col -> Array.fold_left ( + ) 0 (Array.map2 ( * ) row col)) bt)
    a

let () =
  let a = [| [| 1; 2 |]; [| 3; 4 |] |] in
  let b = [| [| 5; 6 |]; [| 7; 8 |] |] in
  let product = multiply a b in
  Array.iter (fun row -> Array.iter (Printf.printf "%d ") row; print_newline ()) product
