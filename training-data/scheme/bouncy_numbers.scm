;; Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
(define (digits n)
  (if (< n 10) (list n)
      (append (digits (quotient n 10)) (list (remainder n 10)))))

(define (monotone? ds cmp)
  (or (null? ds) (null? (cdr ds))
      (and (cmp (car ds) (cadr ds)) (monotone? (cdr ds) cmp))))

(define (bouncy? n)
  (let ((d (digits n)))
    (and (not (monotone? d <=)) (not (monotone? d >=)))))

(let loop ((n 1) (count 0))
  (if (>= n 1000)
      (begin (display count) (newline))
      (loop (+ n 1) (if (bouncy? n) (+ count 1) count))))
