let color_name = function
  | `Red -> "red"
  | `Green -> "green"
  | `Rgb (r, g, b) -> Printf.sprintf "rgb(%d,%d,%d)" r g b

let () =
  List.iter (fun c -> print_endline (color_name c))
    [ `Red; `Green; `Rgb (1, 2, 3) ]
