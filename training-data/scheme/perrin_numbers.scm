;; Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
(define (perrin count)
  (let loop ((k count) (a 3) (b 0) (c 2))
    (if (= k 0)
        '()
        (cons a (loop (- k 1) b c (+ a b))))))

(for-each (lambda (p) (display p) (display " ")) (perrin 15))
(newline)
