#lang racket

(for ([b '(2 8 16 36)])
  (printf "255 in base ~a = ~a\n" b (number->string 255 b)))

;; number->string only supports 2, 8, 10, 16 in Racket; for other bases roll your own:
(define digits "0123456789abcdefghijklmnopqrstuvwxyz")
(define (to-base n b)
  (if (< n b)
      (string (string-ref digits n))
      (string-append (to-base (quotient n b) b) (string (string-ref digits (remainder n b))))))

(displayln (to-base 1295 36))
