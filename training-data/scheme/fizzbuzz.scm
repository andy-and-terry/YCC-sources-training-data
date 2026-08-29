(define (fizzbuzz n)
  (let loop ((i 1))
    (if (<= i n)
        (begin
          (cond
            ((= 0 (remainder i 15)) (display "FizzBuzz"))
            ((= 0 (remainder i 3)) (display "Fizz"))
            ((= 0 (remainder i 5)) (display "Buzz"))
            (else (display i)))
          (newline)
          (loop (+ i 1))))))

(fizzbuzz 20)
