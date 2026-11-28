(define (pronic? x)
  (let ((n (exact (floor (sqrt x)))))
    (= x (* n (+ n 1)))))

(display (map (lambda (n) (* n (+ n 1))) '(0 1 2 3 4 5 6 7 8 9)))
(newline) ; (0 2 6 12 20 30 42 56 72 90)
(display (list (pronic? 56) (pronic? 57)))
(newline) ; (#t #f)
