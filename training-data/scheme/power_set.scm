;; The power set of a list: every subset, built by recursively deciding
;; whether to include or exclude the first element.

(define (power-set lst)
  (if (null? lst)
      '(())
      (let ((rest (power-set (cdr lst))))
        (append rest (map (lambda (s) (cons (car lst) s)) rest)))))

(display (power-set '(1 2 3)))
(newline)
(display (length (power-set '(a b c d))))
(newline)
