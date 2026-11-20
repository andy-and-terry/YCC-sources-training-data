;; Manhattan distance.
(define (manhattan a b) (apply + (map (lambda (x y) (abs (- x y))) a b)))
(display (manhattan '(1 2) '(4 6))) (newline)
