(* The strategy pattern is nothing more than a function value in a
   language with first-class functions: `checkout` doesn't know or
   care which pricing rule it's handed. *)

type pricing_strategy = int * real -> real

fun regularPricing (qty, price) : real = real qty * price

fun premiumPricing (qty, price) : real = real qty * price * 1.2

fun discountPricing pct (qty, price) : real = real qty * price * (1.0 - pct)

fun checkout (strategy : pricing_strategy) (qty, price) = strategy (qty, price)

val () = print (Real.toString (checkout regularPricing (3, 10.0)) ^ "\n")
val () = print (Real.toString (checkout premiumPricing (3, 10.0)) ^ "\n")
val () = print (Real.toString (checkout (discountPricing 0.1) (3, 10.0)) ^ "\n")
