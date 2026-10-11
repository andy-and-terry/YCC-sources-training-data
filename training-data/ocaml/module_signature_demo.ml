module type COUNTER = sig
  type t
  val create : unit -> t
  val incr : t -> t
  val value : t -> int
end

module Counter : COUNTER = struct
  type t = int
  let create () = 0
  let incr n = n + 1
  let value n = n
end

let () =
  let c = Counter.create () in
  let c = Counter.incr (Counter.incr (Counter.incr c)) in
  Printf.printf "counter = %d\n" (Counter.value c)
