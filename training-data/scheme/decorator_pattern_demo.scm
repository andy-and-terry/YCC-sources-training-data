;; Decorator pattern via function wrapping: each decorator takes a
;; coffee (a cost . description pair) and returns a new one that
;; wraps the inner cost/description instead of mutating it.

(define (make-coffee) (cons 2 "coffee"))

(define (with-milk coffee)
  (cons (+ (car coffee) 0.5) (string-append (cdr coffee) " + milk")))

(define (with-sugar coffee)
  (cons (+ (car coffee) 0.25) (string-append (cdr coffee) " + sugar")))

(define plain (make-coffee))
(define fancy (with-sugar (with-milk (make-coffee))))

(display (cdr plain)) (display ": ") (display (car plain)) (newline)
(display (cdr fancy)) (display ": ") (display (car fancy)) (newline)
