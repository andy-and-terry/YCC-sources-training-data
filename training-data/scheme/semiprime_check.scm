(define (prime-factor-count n)
  (let loop ((n n) (p 2) (count 0))
    (cond ((> (* p p) n) (if (> n 1) (+ count 1) count))
          ((= (remainder n p) 0) (loop (quotient n p) p (+ count 1)))
          (else (loop n (+ p 1) count)))))

(do ((n 2 (+ n 1))) ((>= n 30))
  (if (= (prime-factor-count n) 2) (begin (display n) (display " "))))
(newline)
