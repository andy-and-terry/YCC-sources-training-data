(define (stream-car s) (car s))
(define (stream-cdr s) (force (cdr s)))

(define (integers-from n)
  (cons n (delay (integers-from (+ n 1)))))

(define (stream-take s n)
  (if (= n 0)
      '()
      (cons (stream-car s) (stream-take (stream-cdr s) (- n 1)))))

(define (stream-map f s)
  (cons (f (stream-car s)) (delay (stream-map f (stream-cdr s)))))

(define nats (integers-from 0))
(define squares (stream-map (lambda (x) (* x x)) nats))

(display (stream-take nats 10))
(newline)
(display (stream-take squares 10))
(newline)
