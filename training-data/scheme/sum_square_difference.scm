;; Square of the sum minus sum of squares for 1..10 (expect 2640)
(define (sum-to n f)
  (let loop ((i 1) (acc 0))
    (if (> i n) acc (loop (+ i 1) (+ acc (f i))))))

(define total (sum-to 10 (lambda (i) i)))
(define squares (sum-to 10 (lambda (i) (* i i))))
(display (- (* total total) squares))
(newline)
