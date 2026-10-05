exception InsufficientFunds of int

fun makeAccount initial =
  let
    val balance = ref initial
    fun deposit n = (balance := !balance + n; !balance)
    fun withdraw n =
      if n > !balance then raise InsufficientFunds (!balance)
      else (balance := !balance - n; !balance)
    fun get () = !balance
  in
    {deposit = deposit, withdraw = withdraw, balance = get}
  end

val acct = makeAccount 100
val () = print (Int.toString (#withdraw acct 30) ^ "\n")
val () = print (Int.toString (#deposit acct 50) ^ "\n")
val () =
  (#withdraw acct 500; ())
  handle InsufficientFunds b => print ("insufficient, balance is " ^ Int.toString b ^ "\n")
val () = print (Int.toString (#balance acct ()) ^ "\n")

fun makeCounter () =
  let val n = ref 0 in fn () => (n := !n + 1; !n) end

val c1 = makeCounter ()
val c2 = makeCounter ()
val _ = c1 ()
val _ = c1 ()
val () = print (Int.toString (c1 ()) ^ " " ^ Int.toString (c2 ()) ^ "\n")
