;; Classic `do` loop: R7RS's built-in iteration construct with
;; step expressions and an explicit termination test.

(define (sum-of-squares n)
  (do ((i 1 (+ i 1))
       (total 0 (+ total (* i i))))
      ((> i n) total)))

(define (vector-fill-squares! v)
  (do ((i 0 (+ i 1)))
      ((= i (vector-length v)) v)
    (vector-set! v i (* i i))))

(display (sum-of-squares 5))
(newline)
(display (vector-fill-squares! (make-vector 5 0)))
(newline)
