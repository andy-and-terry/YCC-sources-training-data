(* Counts connected components of 1s ("islands") in a 2D 0/1 grid
   using recursive flood fill with a visited matrix. *)
fun count_islands grid =
  let
    val rows = Array.length grid
    val cols = Array.length (Array.sub (grid, 0))
    val visited = Array.tabulate (rows, fn _ => Array.array (cols, false))

    fun in_bounds (r, c) = r >= 0 andalso r < rows andalso c >= 0 andalso c < cols

    fun flood (r, c) =
      if not (in_bounds (r, c)) then ()
      else if Array.sub (Array.sub (visited, r), c) then ()
      else if Array.sub (Array.sub (grid, r), c) = 0 then ()
      else
        (Array.update (Array.sub (visited, r), c, true);
         flood (r + 1, c);
         flood (r - 1, c);
         flood (r, c + 1);
         flood (r, c - 1))

    val count = ref 0
    val () =
      List.app
        (fn r =>
          List.app
            (fn c =>
              if Array.sub (Array.sub (grid, r), c) = 1
                 andalso not (Array.sub (Array.sub (visited, r), c))
              then (count := !count + 1; flood (r, c))
              else ())
            (List.tabulate (cols, fn i => i)))
        (List.tabulate (rows, fn i => i))
  in
    !count
  end

val grid =
  Array.fromList
    (map Array.fromList
      [[1, 1, 0, 0, 0],
       [1, 1, 0, 0, 1],
       [0, 0, 1, 0, 1],
       [0, 0, 0, 1, 1]])

val () = print (Int.toString (count_islands grid) ^ "\n")
