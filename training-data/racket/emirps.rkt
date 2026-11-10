#lang racket
(define (prime? n)
  (and (>= n 2) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))
(define (rev n) (string->number (list->string (reverse (string->list (number->string n))))))
(define (emirp? n) (let ([r (rev n)]) (and (not (= r n)) (prime? n) (prime? r))))
;; Collect the first `left` emirps starting from n.
(define (collect n left acc)
  (cond [(zero? left) (reverse acc)]
        [(emirp? n) (collect (add1 n) (sub1 left) (cons n acc))]
        [else (collect (add1 n) left acc)]))
(displayln (collect 2 10 '())) ; (13 17 31 37 71 73 79 97 107 113)
