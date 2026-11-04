#lang racket

(define (ordinal n)
  (define suffix
    (cond [(<= 11 (modulo n 100) 13) "th"]
          [(= (modulo n 10) 1) "st"]
          [(= (modulo n 10) 2) "nd"]
          [(= (modulo n 10) 3) "rd"]
          [else "th"]))
  (format "~a~a" n suffix))

(displayln (string-join (map ordinal '(1 2 3 4 11 12 13 21 101 111)) " "))
