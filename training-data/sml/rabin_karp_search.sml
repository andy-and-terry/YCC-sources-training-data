fun rabin_karp_search (text, pattern) =
  let
    val n = String.size text
    val m = String.size pattern
    val base = 256
    val prime = 101
  in
    if m = 0 orelse m > n then ~1
    else
      let
        fun pow_mod (b, 0) = 1
          | pow_mod (b, e) = (b * pow_mod (b, e - 1)) mod prime
        val h = pow_mod (base, m - 1)
        fun hash_of (s, start, len) =
          let
            fun loop (i, acc) =
              if i >= len then acc
              else loop (i + 1, (acc * base + Char.ord (String.sub (s, start + i))) mod prime)
          in
            loop (0, 0)
          end
        val pattern_hash = hash_of (pattern, 0, m)
        fun matches_at i =
          let
            fun check j = j >= m orelse (String.sub (text, i + j) = String.sub (pattern, j) andalso check (j + 1))
          in
            check 0
          end
        fun search (i, text_hash) =
          if text_hash = pattern_hash andalso matches_at i then i
          else if i = n - m then ~1
          else
            let
              val old_char = Char.ord (String.sub (text, i))
              val new_char = Char.ord (String.sub (text, i + m))
              val next_hash = (base * (text_hash - old_char * h) + new_char) mod prime
            in
              search (i + 1, next_hash)
            end
      in
        search (0, hash_of (text, 0, m))
      end
  end

val () = print (Int.toString (rabin_karp_search ("abxabcabcaby", "abcaby")) ^ "\n")
val () = print (Int.toString (rabin_karp_search ("hello world", "xyz")) ^ "\n")
