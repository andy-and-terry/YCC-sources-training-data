;; Woodall numbers: W(n) = n * 2^n - 1
(define (woodall n)
  (- (* n (expt 2 n)) 1))

(define (print-list lst)
  (if (not (null? lst))
      (begin
        (display (car lst))
        (for-each (lambda (x) (display " ") (display x)) (cdr lst))))
  (newline))

(define (build n limit)
  (if (> n limit)
      '()
      (cons (woodall n) (build (+ n 1) limit))))

(print-list (build 1 10))
