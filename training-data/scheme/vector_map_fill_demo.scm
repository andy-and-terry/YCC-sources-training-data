(define v (vector 1 2 3 4))

(display (vector-map (lambda (x) (* x x)) v))
(newline)

(vector-for-each (lambda (x) (display x) (display " ")) v)
(newline)

(define w (make-vector 3 'x))
(vector-fill! w 'y)
(display w)
(newline)
(display (vector-length v))
(newline)
