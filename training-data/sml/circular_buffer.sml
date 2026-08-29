datatype circular_buffer = CB of { data: int array, capacity: int, size: int ref, start: int ref }

fun new_buffer capacity = CB { data = Array.array (capacity, 0), capacity = capacity, size = ref 0, start = ref 0 }

fun push (CB { data, capacity, size, start }, value) =
  let
    val index = (!start + !size) mod capacity
    val () = Array.update (data, index, value)
  in
    if !size < capacity then size := !size + 1
    else start := (!start + 1) mod capacity
  end

fun to_list (CB { data, capacity, size, start }) =
  List.tabulate (!size, fn i => Array.sub (data, (!start + i) mod capacity))

val buf = new_buffer 3
val () = app (fn v => push (buf, v)) [1, 2, 3, 4, 5]
val () = print (String.concatWith " " (map Int.toString (to_list buf)) ^ "\n")
