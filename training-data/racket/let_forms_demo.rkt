#lang racket

(define x 10)
;; let binds in parallel: inner x refers to outer x
(displayln (let ([x 1] [y x]) (+ x y)))
;; let* binds sequentially
(displayln (let* ([x 1] [y (+ x 1)] [z (* y 2)]) (list x y z)))
;; letrec allows mutual recursion
(displayln
 (letrec ([ev? (lambda (n) (if (zero? n) #t (od? (sub1 n))))]
          [od? (lambda (n) (if (zero? n) #f (ev? (sub1 n))))])
   (ev? 10)))
;; let-values
(let-values ([(q r) (quotient/remainder 17 5)])
  (printf "q=~a r=~a\n" q r))
;; internal defines in a body
(define (f n)
  (define a (* n 2))
  (define (g k) (+ a k))
  (g 1))
(displayln (f 5))
