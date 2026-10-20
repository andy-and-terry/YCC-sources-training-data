(define env '((a . 1) (b . 2)))
(display (cdr (assq 'b env))) (newline)
(display (map (lambda (p) (* 2 (cdr p))) env)) (newline)
