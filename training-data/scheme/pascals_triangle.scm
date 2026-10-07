;; Pascal's triangle rows
(define (next-row row)
  (let loop ((prev row) (acc '(1)))
    (if (null? (cdr prev))
        (reverse (cons 1 acc))
        (loop (cdr prev) (cons (+ (car prev) (cadr prev)) acc)))))

(define (pascal n)
  (let loop ((i 0) (row '(1)) (rows '()))
    (if (= i n)
        (reverse rows)
        (loop (+ i 1) (next-row row) (cons row rows)))))

(for-each (lambda (r) (display r) (newline)) (pascal 6))
