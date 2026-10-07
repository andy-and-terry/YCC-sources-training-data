(* The Z-algorithm: for a string s, z[i] is the length of the
   longest substring starting at i that matches a prefix of s.
   Used here to find all occurrences of a pattern in a text by
   scanning Z of (pattern ^ "#" ^ text). *)
fun z_array s =
  let
    val n = String.size s
    val z = Array.array (n, 0)
    val l = ref 0
    val r = ref 0
  in
    List.app
      (fn i =>
        if i = 0 then ()
        else
          (if i < !r then
             Array.update (z, i, Int.min (!r - i, Array.sub (z, i - !l)))
           else ();
           (let
              fun extend () =
                if i + Array.sub (z, i) < n
                   andalso String.sub (s, Array.sub (z, i)) = String.sub (s, i + Array.sub (z, i))
                then (Array.update (z, i, Array.sub (z, i) + 1); extend ())
                else ()
            in
              extend ()
            end);
           if i + Array.sub (z, i) > !r then (l := i; r := i + Array.sub (z, i)) else ()))
      (List.tabulate (n, fn i => i));
    z
  end

fun z_search (text, pattern) =
  let
    val combined = pattern ^ "#" ^ text
    val z = z_array combined
    val plen = String.size pattern
  in
    List.filter
      (fn i => Array.sub (z, i) >= plen)
      (List.tabulate (Array.length z, fn i => i - plen - 1))
  end

val matches = z_search ("abxabcabcaby", "abc")
val () = print (String.concatWith " " (map Int.toString matches) ^ "\n")
