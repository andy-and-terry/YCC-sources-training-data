(define (integers-from n)
  (cons n (delay (integers-from (+ n 1)))))

(define (stream-take s k)
  (if (= k 0)
      '()
      (cons (car s) (stream-take (force (cdr s)) (- k 1)))))

(display (stream-take (integers-from 5) 5))
(newline)

(define p (delay (begin (display "computing ") 42)))
(display (force p))
(display (force p))
(newline)
