#lang racket

;; Optional positional arguments use a default value expression;
;; keyword arguments are named at the call site with #:name.

(define (greet name [greeting "Hello"])
  (format "~a, ~a!" greeting name))

(displayln (greet "Ada"))
(displayln (greet "Bob" "Hi"))

(define (make-rectangle #:width w #:height [h w])
  (list 'rectangle w h))

(displayln (make-rectangle #:width 4 #:height 6))
(displayln (make-rectangle #:width 5))

(define (sum-all . nums)
  (apply + nums))

(displayln (sum-all 1 2 3 4 5))
