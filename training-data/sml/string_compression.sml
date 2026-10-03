(* Run-length-style string compression: "aaabccccd" -> "a3bc4d1",
   where a single-occurrence run is written with count 1 for
   uniformity (distinct from run_length_encoding.sml, which returns
   (char, count) pairs instead of a formatted string). *)
fun compress s =
  let
    val n = String.size s
    fun go (i, acc) =
      if i >= n then acc
      else
        let
          val c = String.sub (s, i)
          fun count_run j = if j < n andalso String.sub (s, j) = c then count_run (j + 1) else j
          val j = count_run i
          val run_len = j - i
        in
          go (j, acc ^ String.str c ^ Int.toString run_len)
        end
  in
    go (0, "")
  end

val () = print (compress "aaabccccd" ^ "\n")
val () = print (compress "abcd" ^ "\n")
val () = print (compress "aaaaaaaaaa" ^ "\n")
