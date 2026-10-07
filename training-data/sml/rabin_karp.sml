(* Rabin-Karp substring search using a polynomial rolling hash. *)

val base = 256
val prime = 101

fun pow_mod (b, 0, m) = 1
  | pow_mod (b, e, m) =
      if e mod 2 = 0 then
        let val h = pow_mod (b, e div 2, m) in (h * h) mod m end
      else (b * pow_mod (b, e - 1, m)) mod m

fun hash_of (s, start, len) =
  let
    fun loop (i, h, count) =
      if count = len then h
      else loop (i + 1, (h * base + Char.ord (String.sub (s, i))) mod prime, count + 1)
  in
    loop (start, 0, 0)
  end

fun rabin_karp (text, pattern) =
  let
    val n = String.size text
    val m = String.size pattern
    val highOrder = pow_mod (base, m - 1, prime)
    val patternHash = hash_of (pattern, 0, m)
    fun loop (i, textHash) =
      if i > n - m then ~1
      else if textHash = patternHash andalso String.substring (text, i, m) = pattern then i
      else if i = n - m then ~1
      else
        let
          val dropped = Char.ord (String.sub (text, i))
          val added = Char.ord (String.sub (text, i + m))
          val nextHash = ((textHash - (dropped * highOrder mod prime)) * base + added) mod prime
        in
          loop (i + 1, nextHash)
        end
  in
    if m = 0 orelse m > n then ~1 else loop (0, hash_of (text, 0, m))
  end

val () = print (Int.toString (rabin_karp ("abxabcabcaby", "abcaby")) ^ "\n")
val () = print (Int.toString (rabin_karp ("hello world", "xyz")) ^ "\n")
