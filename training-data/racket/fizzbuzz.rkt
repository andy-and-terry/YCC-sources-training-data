#lang racket

(define (fizzbuzz n)
  (for ([i (in-range 1 (add1 n))])
    (cond
      [(= 0 (remainder i 15)) (displayln "FizzBuzz")]
      [(= 0 (remainder i 3)) (displayln "Fizz")]
      [(= 0 (remainder i 5)) (displayln "Buzz")]
      [else (displayln i)])))

(fizzbuzz 20)
