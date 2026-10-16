;; Ackermann's function and a count of how many calls it makes.

(define calls 0)

(define (ack m n)
  (set! calls (+ calls 1))
  (cond ((= m 0) (+ n 1))
        ((= n 0) (ack (- m 1) 1))
        (else (ack (- m 1) (ack m (- n 1))))))

(display (ack 1 3)) (newline)
(display (ack 2 3)) (newline)
(set! calls 0)
(display (ack 2 2)) (newline)
(display calls) (newline)
(display (ack 3 3)) (newline)
