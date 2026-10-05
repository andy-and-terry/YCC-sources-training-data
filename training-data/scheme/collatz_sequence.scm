;; Collatz sequence and the longest chain below a bound.

(define (collatz-step n)
  (if (even? n) (quotient n 2) (+ (* 3 n) 1)))

(define (collatz-length n)
  (let loop ((n n) (steps 1))
    (if (= n 1) steps (loop (collatz-step n) (+ steps 1)))))

(define (collatz n)
  (if (= n 1)
      '(1)
      (cons n (collatz (collatz-step n)))))

(display (collatz 6)) (newline)
(display (collatz-length 27)) (newline)

(define (longest-below limit)
  (let loop ((n 1) (best 1) (best-len 1))
    (if (>= n limit)
        (cons best best-len)
        (let ((len (collatz-length n)))
          (if (> len best-len)
              (loop (+ n 1) n len)
              (loop (+ n 1) best best-len))))))

(display (longest-below 1000)) (newline)
