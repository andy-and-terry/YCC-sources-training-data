datatype heap = Heap of { data: int array, capacity: int, size: int ref }

fun new_heap capacity = Heap { data = Array.array (capacity, 0), capacity = capacity, size = ref 0 }

fun swap (arr, i, j) =
  let val tmp = Array.sub (arr, i) in
    Array.update (arr, i, Array.sub (arr, j));
    Array.update (arr, j, tmp)
  end

fun sift_up (data, i) =
  if i = 0 then ()
  else
    let val parent = (i - 1) div 2 in
      if Array.sub (data, i) < Array.sub (data, parent) then
        (swap (data, i, parent); sift_up (data, parent))
      else ()
    end

fun sift_down (data, size, i) =
  let
    val left = 2 * i + 1
    val right = 2 * i + 2
    val smallest = if left < size andalso Array.sub (data, left) < Array.sub (data, i) then left else i
    val smallest = if right < size andalso Array.sub (data, right) < Array.sub (data, smallest) then right else smallest
  in
    if smallest <> i then (swap (data, i, smallest); sift_down (data, size, smallest))
    else ()
  end

fun heap_push (Heap { data, size, ... }, v) =
  (Array.update (data, !size, v); size := !size + 1; sift_up (data, !size - 1))

fun heap_pop (Heap { data, size, ... }) =
  let
    val top = Array.sub (data, 0)
    val () = size := !size - 1
  in
    Array.update (data, 0, Array.sub (data, !size));
    sift_down (data, !size, 0);
    top
  end

val h = new_heap 10
val () = app (fn v => heap_push (h, v)) [5, 3, 8, 1, 9, 2]

val results = ref []
val () =
  let
    fun loop 0 = ()
      | loop n =
          let val v = heap_pop h in
            results := v :: !results;
            loop (n - 1)
          end
  in
    loop 6
  end

val () = print (String.concatWith " " (map Int.toString (List.rev (!results))) ^ "\n")
