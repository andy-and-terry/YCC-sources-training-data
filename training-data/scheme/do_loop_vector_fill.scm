(define v (make-vector 5 0))
(do ((i 0 (+ i 1))) ((= i 5)) (vector-set! v i (* i i)))
(display v) (newline)
