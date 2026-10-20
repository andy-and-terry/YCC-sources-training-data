let color_name = function `Red -> "red" | `Green -> "green" | `Rgb (r, g, b) -> Printf.sprintf "rgb(%d,%d,%d)" r g b

let () =
  List.iter (fun c -> print_endline (color_name c)) [ `Red; `Green; `Rgb (1, 2, 3) ];
  let counter =
    object
      val mutable n = 0
      method incr = n <- n + 1
      method get = n
    end
  in
  counter#incr;
  counter#incr;
  Printf.printf "%d\n" counter#get;
  let point x y = object method x = x method y = y method dist = sqrt (float_of_int ((x * x) + (y * y))) end in
  Printf.printf "%.1f\n" (point 3 4)#dist
