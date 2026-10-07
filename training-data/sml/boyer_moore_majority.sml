(* Boyer-Moore majority vote: finds the element appearing more than
   n/2 times in a single linear pass, if one exists. *)
fun majority_candidate xs =
  case xs of
      [] => NONE
    | first :: _ =>
        let
          fun scan ([], cand, _) = cand
            | scan (x :: rest, cand, count) =
                if count = 0 then scan (rest, x, 1)
                else if x = cand then scan (rest, cand, count + 1)
                else scan (rest, cand, count - 1)
          val cand = scan (xs, first, 0)
          val occurrences = length (List.filter (fn x => x = cand) xs)
        in
          if occurrences * 2 > length xs then SOME cand else NONE
        end

val () =
  case majority_candidate [2, 2, 1, 1, 1, 2, 2] of
    SOME v => print ("majority: " ^ Int.toString v ^ "\n")
  | NONE => print "no majority\n"

val () =
  case majority_candidate [1, 2, 3, 4] of
    SOME v => print ("majority: " ^ Int.toString v ^ "\n")
  | NONE => print "no majority\n"
