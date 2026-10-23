;; In-place vector operations: swap, reverse, and a Fisher-Yates style rotate.

(define (vector-swap! v i j)
  (let ((tmp (vector-ref v i)))
    (vector-set! v i (vector-ref v j))
    (vector-set! v j tmp)))

(define (vector-reverse! v)
  (let loop ((i 0) (j (- (vector-length v) 1)))
    (if (< i j)
        (begin (vector-swap! v i j)
               (loop (+ i 1) (- j 1))))))

(define (vector-rotate-left! v)
  (let ((first (vector-ref v 0)) (n (vector-length v)))
    (do ((i 0 (+ i 1))) ((= i (- n 1)))
      (vector-set! v i (vector-ref v (+ i 1))))
    (vector-set! v (- n 1) first)))

(define v (vector 1 2 3 4 5))
(vector-swap! v 0 4)
(display v) (newline)           ; #(5 2 3 4 1)

(vector-reverse! v)
(display v) (newline)           ; #(1 4 3 2 5)

(vector-rotate-left! v)
(display v) (newline)           ; #(4 3 2 5 1)

;; vector-map and vector->list leave the original alone.
(display (vector-map (lambda (x) (* x x)) v)) (newline)
(display (vector->list v)) (newline)
(display (vector-fill! (make-vector 3 0) 7)) (newline)
