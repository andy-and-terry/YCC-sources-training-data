module type SHAPE = sig
  val area : float
  val name : string
end

let make_circle r =
  (module struct
    let area = Float.pi *. r *. r
    let name = "circle"
  end : SHAPE)

let make_square s =
  (module struct
    let area = s *. s
    let name = "square"
  end : SHAPE)

let describe (module S : SHAPE) = Printf.sprintf "%s: %.2f" S.name S.area

let () =
  let shapes = [ make_circle 2.0; make_square 3.0 ] in
  List.iter (fun s -> print_endline (describe s)) shapes
