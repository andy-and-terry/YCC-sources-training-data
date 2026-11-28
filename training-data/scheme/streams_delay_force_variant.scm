(define (ints n) (cons n (delay (ints (+ n 1)))))
(define (take s k) (if (= k 0) '() (cons (car s) (take (force (cdr s)) (- k 1)))))

(display (take (ints 1) 5))
(newline)
