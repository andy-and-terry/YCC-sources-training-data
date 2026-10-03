(* Classic monotonic-stack next-greater-element: for each position,
   find the nearest element to its right that is strictly larger,
   or ~1 if none exists. *)
fun next_greater xs =
  let
    val arr = Array.fromList xs
    val n = Array.length arr
    val result = Array.array (n, ~1)
    fun go (i, stack) =
      if i >= n then ()
      else
        let
          val v = Array.sub (arr, i)
          fun pop_smaller [] = []
            | pop_smaller (top :: rest) =
                if Array.sub (arr, top) < v then
                  (Array.update (result, top, v); pop_smaller rest)
                else top :: rest
          val stack' = pop_smaller stack
        in
          go (i + 1, i :: stack')
        end
  in
    go (0, []);
    result
  end

val result = next_greater [2, 1, 2, 4, 3]
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] result)) ^ "\n")
