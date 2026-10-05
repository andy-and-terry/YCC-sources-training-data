(defun fizzbuzz (n)
  (loop for i from 1 to n
        do (format t "~a~%"
                   (cond ((zerop (mod i 15)) "FizzBuzz")
                         ((zerop (mod i 3)) "Fizz")
                         ((zerop (mod i 5)) "Buzz")
                         (t i)))))

(fizzbuzz 15)
