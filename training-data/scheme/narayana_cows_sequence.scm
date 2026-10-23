;; Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
(define (cows count)
  (let loop ((k count) (a 1) (b 1) (c 1))
    (if (= k 0)
        '()
        (cons a (loop (- k 1) b c (+ a c))))))

(for-each (lambda (n) (display n) (display " ")) (cows 15))
(newline)
