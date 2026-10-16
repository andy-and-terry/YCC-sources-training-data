;; Church numerals: numbers encoded purely as functions.

(define zero (lambda (f) (lambda (x) x)))
(define (succ n) (lambda (f) (lambda (x) (f ((n f) x)))))
(define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))
(define (mul a b) (lambda (f) (a (b f))))

(define (church->int n) ((n (lambda (k) (+ k 1))) 0))

(define one (succ zero))
(define two (succ one))
(define three (add one two))

(display (church->int zero)) (newline)
(display (church->int three)) (newline)
(display (church->int (mul three two))) (newline)
(display (church->int (add (mul two two) three))) (newline)
