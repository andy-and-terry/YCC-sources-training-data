datatype lru_cache = LRU of { capacity: int, map: (int * int) list ref, order: int list ref }

fun new_lru capacity = LRU { capacity = capacity, map = ref [], order = ref [] }

fun lru_get (LRU { map, order, ... }, key) =
  case List.find (fn (k, _) => k = key) (!map) of
    SOME (_, v) => (order := key :: List.filter (fn k => k <> key) (!order); SOME v)
  | NONE => NONE

fun lru_put (LRU { capacity, map, order }, key, value) =
  let
    val () = map := (key, value) :: List.filter (fn (k, _) => k <> key) (!map)
    val () = order := key :: List.filter (fn k => k <> key) (!order)
  in
    if length (!order) > capacity then
      let val evict = List.last (!order) in
        map := List.filter (fn (k, _) => k <> evict) (!map);
        order := List.filter (fn k => k <> evict) (!order)
      end
    else ()
  end

val cache = new_lru 2
val () = lru_put (cache, 1, 1)
val () = lru_put (cache, 2, 2)
val () = print (Int.toString (valOf (lru_get (cache, 1))) ^ "\n")
val () = lru_put (cache, 3, 3)
val () = print ((case lru_get (cache, 2) of SOME v => Int.toString v | NONE => "none") ^ "\n")
