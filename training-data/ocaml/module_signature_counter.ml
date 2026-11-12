module type COUNTER = sig
  type t
  val create : unit -> t
  val incr : t -> t
  val get : t -> int
end
module C : COUNTER = struct
  type t = int
  let create () = 0
  let incr n = n + 1
  let get n = n
end
let () = print_int (C.get (C.incr (C.incr (C.create ())))); print_newline ()
