signature RATIONAL = sig
  type t
  val make : int * int -> t
  val add : t * t -> t
  val mul : t * t -> t
  val toString : t -> string
end

structure Rational :> RATIONAL = struct
  type t = int * int

  fun gcd (a, 0) = abs a
    | gcd (a, b) = gcd (b, a mod b)

  fun make (n, d) =
    let
      val g = gcd (n, d)
      val s = if d < 0 then ~1 else 1
    in
      (s * n div g, s * d div g)
    end

  fun add ((a, b), (c, d)) = make (a * d + c * b, b * d)
  fun mul ((a, b), (c, d)) = make (a * c, b * d)
  fun toString (n, d) = if d = 1 then Int.toString n else Int.toString n ^ "/" ^ Int.toString d
end

val half = Rational.make (1, 2)
val third = Rational.make (2, 6)
val () = print (Rational.toString (Rational.add (half, third)) ^ "\n")
val () = print (Rational.toString (Rational.mul (half, third)) ^ "\n")
val () = print (Rational.toString (Rational.add (half, half)) ^ "\n")
