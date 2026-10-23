module type SHOW = sig
  type t
  val v : t
  val show : t -> string
end

let int_show = (module struct type t = int let v = 42 let show = string_of_int end : SHOW)
let str_show = (module struct type t = string let v = "hi" let show s = "\"" ^ s ^ "\"" end : SHOW)

let print (module S : SHOW) = print_endline (S.show S.v)

let () = List.iter print [ int_show; str_show ]
