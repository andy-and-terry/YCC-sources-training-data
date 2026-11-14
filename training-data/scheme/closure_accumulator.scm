(define (make-acc total)
  (lambda (x) (set! total (+ total x)) total))

(define acc (make-acc 10))
(acc 5)
(display (acc 5))
(newline)
