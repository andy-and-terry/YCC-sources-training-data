datatype instr = Push of int | AddI | MulI | SubI | Dup

exception StackUnderflow

fun step (Push n, st) = n :: st
  | step (AddI, a :: b :: st) = (b + a) :: st
  | step (MulI, a :: b :: st) = (b * a) :: st
  | step (SubI, a :: b :: st) = (b - a) :: st
  | step (Dup, a :: st) = a :: a :: st
  | step _ = raise StackUnderflow

fun run prog = foldl step [] prog

val result = run [Push 3, Dup, MulI, Push 4, AddI]
val () = print (Int.toString (hd result) ^ "\n")
val () = print ((Int.toString (hd (run [AddI]))) handle StackUnderflow => "underflow")
val () = print "\n"
