;; Zeckendorf representation: greedy sum of non-consecutive Fibonacci numbers.
;; Fibonacci numbers up to n, largest first.
(define (fibs-up-to n)
  (let loop ((a 1) (b 2) (acc '()))
    (if (> a n)
        acc
        (loop b (+ a b) (cons a acc)))))

(define (zeckendorf n)
  (let loop ((fs (fibs-up-to n)) (rest n) (parts '()))
    (cond ((null? fs) (reverse parts))
          ((<= (car fs) rest)
           (loop (cdr fs) (- rest (car fs)) (cons (car fs) parts)))
          (else (loop (cdr fs) rest parts)))))

(define (print-list lst)
  (if (not (null? lst))
      (begin
        (display (car lst))
        (for-each (lambda (x) (display " ") (display x)) (cdr lst))))
  (newline))

(print-list (zeckendorf 100))
