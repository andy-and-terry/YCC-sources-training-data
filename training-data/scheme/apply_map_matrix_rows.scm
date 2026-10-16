;; Using apply with map to transpose and combine rows of numbers.

(define matrix '((1 2 3) (4 5 6) (7 8 9)))

(define (transpose m)
  (apply map list m))

(define (row-sums m) (map (lambda (r) (apply + r)) m))
(define (col-sums m) (apply map + m))
(define (matrix-max m) (apply max (apply append m)))

(define (diagonal m)
  (let loop ((rows m) (i 0))
    (if (null? rows)
        '()
        (cons (list-ref (car rows) i) (loop (cdr rows) (+ i 1))))))

(display (transpose matrix)) (newline)
(display (row-sums matrix)) (newline)
(display (col-sums matrix)) (newline)
(display (matrix-max matrix)) (newline)
(display (diagonal matrix)) (newline)
