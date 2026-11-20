;; Bead (gravity) sort.
(define (count-if p l) (length (filter p l)))
(define (range a b) (if (> a b) '() (cons a (range (+ a 1) b))))
(define (bead-sort nums)
  (let ((cols (map (lambda (i) (count-if (lambda (n) (>= n i)) nums)) (range 1 (apply max nums)))))
    (reverse (map (lambda (r) (count-if (lambda (c) (>= c r)) cols)) (range 1 (length nums))))))
(display (bead-sort '(5 3 1 4 2))) (newline)
