fun mod_pow (base, 0, m) = 1 mod m
  | mod_pow (base, exp, m) =
      let
        val half = mod_pow (base, exp div 2, m)
        val halfSq = (half * half) mod m
      in
        if exp mod 2 = 0 then halfSq else (halfSq * base) mod m
      end

val () = print (Int.toString (mod_pow (2, 10, 1000)) ^ "\n")
val () = print (Int.toString (mod_pow (7, 128, 13)) ^ "\n")
