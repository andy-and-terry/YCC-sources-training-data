(* Moebius function: 0 if n has a squared prime factor, else (-1)^k. *)
fun mobius n =
  let
    fun go (m, p, acc) =
      if p * p > m then (if m > 1 then ~acc else acc)
      else if m mod p = 0 then
        let val m2 = m div p
        in if m2 mod p = 0 then 0 else go (m2, p + 1, ~acc) end
      else go (m, p + 1, acc)
  in go (n, 2, 1) end

val () = print (String.concatWith " " (List.tabulate (30, fn i => Int.toString (mobius (i + 1)))) ^ "\n")
