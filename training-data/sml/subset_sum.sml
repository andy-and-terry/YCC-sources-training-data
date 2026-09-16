fun has_subset_sum (nums, target) =
  let
    fun helper (_, 0) = true
      | helper ([], _) = false
      | helper (x :: rest, remaining) =
          if remaining < 0 then false
          else helper (rest, remaining - x) orelse helper (rest, remaining)
  in
    helper (nums, target)
  end

val () = print (Bool.toString (has_subset_sum ([3, 34, 4, 12, 5, 2], 9)) ^ "\n")
val () = print (Bool.toString (has_subset_sum ([3, 34, 4, 12, 5, 2], 30)) ^ "\n")
val () = print (Bool.toString (has_subset_sum ([3, 34, 4, 12, 5, 2], 100)) ^ "\n")
