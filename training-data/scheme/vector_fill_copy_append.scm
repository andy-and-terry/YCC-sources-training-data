;; R7RS vector operations: fill, copy, append, and in-place copy.
(define v (make-vector 5 0))
(vector-fill! v 7)
(display v) (newline)

(define w (vector 1 2 3 4 5))
(display (vector-copy w 1 4)) (newline)
(display (vector-append w #(6 7))) (newline)

(define dest (make-vector 6 'x))
(vector-copy! dest 2 w 0 3)
(display dest) (newline)

(vector-fill! dest '- 0 2)
(display dest) (newline)

(display (vector->list w 2)) (newline)
(display (vector-map (lambda (x) (* x x)) w)) (newline)
(display (list->vector (reverse (vector->list w)))) (newline)
