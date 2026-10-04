(defun fizzbuzz (n)
  (cond ((zerop (mod n 15)) "FizzBuzz")
        ((zerop (mod n 3)) "Fizz")
        ((zerop (mod n 5)) "Buzz")
        (t n)))

(loop for i from 1 to 15
      do (format t "~a~%" (fizzbuzz i)))
