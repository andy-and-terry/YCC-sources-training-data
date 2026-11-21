;; Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
(define (digits n)
  (if (< n 10) (list n)
      (append (digits (quotient n 10)) (list (remainder n 10)))))

(define (take lst k)
  (if (= k 0) '() (cons (car lst) (take (cdr lst) (- k 1)))))

(define (keith? n)
  (let ((k (length (digits n))))
    ;; seq is kept newest-first
    (let loop ((seq (reverse (digits n))))
      (if (>= (car seq) n)
          (= (car seq) n)
          (loop (cons (apply + (take seq k)) seq))))))

(do ((n 10 (+ n 1))) ((>= n 1200))
  (if (keith? n) (begin (display n) (display " "))))
(newline)
