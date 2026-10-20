(define (sum-to n)
  (let loop ((i 1) (acc 0))
    (if (> i n) acc (loop (+ i 1) (+ acc i)))))
(display (sum-to 100)) (newline)

(define (range a b) (let loop ((i (- b 1)) (acc '())) (if (< i a) acc (loop (- i 1) (cons i acc)))))
(display (range 0 6)) (newline)

(define (collatz n)
  (let loop ((n n) (steps 0))
    (cond ((= n 1) steps)
          ((even? n) (loop (/ n 2) (+ steps 1)))
          (else (loop (+ (* 3 n) 1) (+ steps 1))))))
(display (collatz 27)) (newline)
