datatype heap = Heap of { data: int array ref, size: int ref }

fun new_heap () = Heap { data = ref (Array.array (64, 0)), size = ref 0 }

fun sift_up (data, i) =
  if i = 0 then ()
  else
    let
      val parent = (i - 1) div 2
    in
      if Array.sub (data, parent) > Array.sub (data, i) then
        let
          val tmp = Array.sub (data, parent)
        in
          Array.update (data, parent, Array.sub (data, i));
          Array.update (data, i, tmp);
          sift_up (data, parent)
        end
      else ()
    end

fun heap_insert (Heap { data, size }, x) =
  let
    val i = !size
  in
    Array.update (!data, i, x);
    size := i + 1;
    sift_up (!data, i)
  end

fun sift_down (data, size, i) =
  let
    val left = 2 * i + 1
    val right = 2 * i + 2
    val smallest =
      if left < size andalso Array.sub (data, left) < Array.sub (data, i) then left else i
    val smallest =
      if right < size andalso Array.sub (data, right) < Array.sub (data, smallest) then right
      else smallest
  in
    if smallest <> i then
      let
        val tmp = Array.sub (data, i)
      in
        Array.update (data, i, Array.sub (data, smallest));
        Array.update (data, smallest, tmp);
        sift_down (data, size, smallest)
      end
    else ()
  end

fun heap_extract_min (Heap { data, size }) =
  let
    val top = Array.sub (!data, 0)
    val last = !size - 1
  in
    Array.update (!data, 0, Array.sub (!data, last));
    size := last;
    sift_down (!data, !size, 0);
    top
  end

val h = new_heap ()
val () = app (fn x => heap_insert (h, x)) [5, 3, 8, 1, 4]
val () = print (Int.toString (heap_extract_min h) ^ "\n")
val () = print (Int.toString (heap_extract_min h) ^ "\n")
val () = print (Int.toString (heap_extract_min h) ^ "\n")
