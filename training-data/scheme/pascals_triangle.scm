;; Pascal's triangle built row by row.

(define (next-row row)
  (map + (cons 0 row) (append row '(0))))

(define (pascal n)
  (let loop ((i 0) (row '(1)) (rows '()))
    (if (= i n)
        (reverse rows)
        (loop (+ i 1) (next-row row) (cons row rows)))))

(for-each (lambda (row) (display row) (newline))
          (pascal 6))
