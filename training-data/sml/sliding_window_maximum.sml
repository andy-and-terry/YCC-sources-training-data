(* Sliding window maximum via a deque of (index, value) kept
   decreasing in value, simulated with lists used as stacks at
   both ends. *)
fun sliding_window_max (xs, k) =
  let
    val arr = Array.fromList xs
    val n = Array.length arr
    fun go (i, deque, acc) =
      if i >= n then List.rev acc
      else
        let
          val v = Array.sub (arr, i)
          val trimmed_back = List.filter (fn (_, dv) => dv >= v) deque
          val pushed = (i, v) :: trimmed_back
          val trimmed_front = List.filter (fn (idx, _) => idx > i - k) pushed
        in
          if i >= k - 1 then
            let
              val (_, maxv) = List.last trimmed_front
            in
              go (i + 1, trimmed_front, maxv :: acc)
            end
          else go (i + 1, trimmed_front, acc)
        end
  in
    go (0, [], [])
  end

val result = sliding_window_max ([1, 3, -1, -3, 5, 3, 6, 7], 3)
val () = print (String.concatWith " " (map Int.toString result) ^ "\n")
