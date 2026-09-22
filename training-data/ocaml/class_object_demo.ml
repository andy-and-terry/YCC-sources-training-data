(* OCaml's object system: classes with mutable fields, methods invoked
   via `#`, and inheritance via `inherit`. Distinct from the module-level
   functors/records/variants already used elsewhere in this folder. *)

class point (x0 : float) (y0 : float) =
  object
    val mutable x = x0
    val mutable y = y0

    method get_x = x
    method get_y = y

    method move dx dy =
      x <- x +. dx;
      y <- y +. dy

    method to_string = Printf.sprintf "(%.1f, %.1f)" x y
  end

class colored_point (x0 : float) (y0 : float) (color0 : string) =
  object
    inherit point x0 y0
    val mutable color = color0
    method get_color = color
    method to_string = Printf.sprintf "(%.1f, %.1f) [%s]" x y color
  end

let () =
  let p = new point 1.0 2.0 in
  p#move 3.0 4.0;
  print_endline p#to_string;

  let cp = new colored_point 0.0 0.0 "red" in
  cp#move 1.0 1.0;
  print_endline cp#to_string;
  print_endline cp#get_color
