;; Vectors: building, mapping, iterating, and converting to and from lists.

(define v (vector 1 2 3 4 5))

(define (vector-map* f vec)
  (let* ((n (vector-length vec))
         (out (make-vector n 0)))
    (do ((i 0 (+ i 1)))
        ((= i n) out)
      (vector-set! out i (f (vector-ref vec i))))))

(define (vector-for-each* f vec)
  (do ((i 0 (+ i 1)))
      ((= i (vector-length vec)))
    (f (vector-ref vec i))))

(display (vector-map* (lambda (x) (* x x)) v))
(newline)
(vector-for-each* (lambda (x) (display x) (display " ")) v)
(newline)
(display (vector->list v))
(newline)
(display (list->vector '(a b c)))
(newline)
(display (vector-length (make-vector 4 'z)))
(newline)
