val a : Word.word = 0wxF0
val b : Word.word = 0wx3C

fun hex w = "0x" ^ Word.toString w

val () = print (hex (Word.andb (a, b)) ^ "\n")
val () = print (hex (Word.orb (a, b)) ^ "\n")
val () = print (hex (Word.xorb (a, b)) ^ "\n")
val () = print (hex (Word.<< (0w1, 0w10)) ^ "\n")
val () = print (hex (Word.>> (a, 0w4)) ^ "\n")
val () = print (hex (Word.andb (Word.notb 0w0, 0wxFF)) ^ "\n")

fun popCount w =
  let fun go (0w0, n) = n
        | go (x, n) = go (Word.>> (x, 0w1), n + (if Word.andb (x, 0w1) = 0w1 then 1 else 0))
  in go (w, 0) end
val () = print (Int.toString (popCount 0wxFF) ^ " " ^ Int.toString (popCount 0w1024) ^ "\n")

fun isPowerOfTwo 0w0 = false
  | isPowerOfTwo w = Word.andb (w, w - 0w1) = 0w0
val () = print (String.concatWith " " (map (Bool.toString o isPowerOfTwo) [0w1, 0w6, 0w8, 0w100, 0w256]) ^ "\n")

fun setBit (w, i) = Word.orb (w, Word.<< (0w1, i))
fun testBit (w, i) = Word.andb (w, Word.<< (0w1, i)) <> 0w0
val flags = setBit (setBit (0w0, 0w1), 0w5)
val () = print (Word.toString flags ^ " " ^ Bool.toString (testBit (flags, 0w5)) ^ " " ^ Bool.toString (testBit (flags, 0w2)) ^ "\n")
val () = print (Int.toString (Word.toInt 0w255) ^ " " ^ Word.fmt StringCvt.BIN 0w10 ^ "\n")
