fun rabinKarpSearch (text, pattern) =
  let
    val base = 256
    val modulus = 1000000007
    val n = String.size text
    val m = String.size pattern
  in
    if m = 0 orelse m > n then []
    else
      let
        fun charAt (s, i) = Char.ord (String.sub (s, i))
        fun power (b, 0) = 1
          | power (b, e) = (b * power (b, e - 1)) mod modulus
        val highOrder = power (base, m - 1)
        fun hashOf (s, start, len) =
          let
            fun go (i, acc) =
              if i = len then acc
              else go (i + 1, (acc * base + charAt (s, start + i)) mod modulus)
          in
            go (0, 0)
          end
        val patternHash = hashOf (pattern, 0, m)
        fun substrEq i =
          let
            fun go j = j = m orelse (String.sub (text, i + j) = String.sub (pattern, j) andalso go (j + 1))
          in
            go 0
          end
        fun loop (i, windowHash, acc) =
          if i > n - m then rev acc
          else
            let
              val matched = windowHash = patternHash andalso substrEq i
              val acc' = if matched then i :: acc else acc
              val nextHash =
                if i < n - m then
                  ((windowHash - charAt (text, i) * highOrder mod modulus + modulus) mod modulus
                     * base + charAt (text, i + m)) mod modulus
                else windowHash
            in
              loop (i + 1, nextHash, acc')
            end
      in
        loop (0, hashOf (text, 0, m), [])
      end
  end

val () = print (String.concatWith " " (map Int.toString (rabinKarpSearch ("abxabcabcaby", "abc"))) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (rabinKarpSearch ("aaaaa", "aa"))) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (rabinKarpSearch ("hello world", "xyz"))) ^ "\n")
