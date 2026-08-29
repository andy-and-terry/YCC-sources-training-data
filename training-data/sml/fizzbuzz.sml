fun fizzbuzz n =
  let
    fun loop i =
      if i > n then ()
      else
        (if i mod 15 = 0 then print "FizzBuzz\n"
         else if i mod 3 = 0 then print "Fizz\n"
         else if i mod 5 = 0 then print "Buzz\n"
         else print (Int.toString i ^ "\n");
         loop (i + 1))
  in
    loop 1
  end

val () = fizzbuzz 20
