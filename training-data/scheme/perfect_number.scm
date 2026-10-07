;; Perfect numbers: n equals the sum of its proper divisors.

(define (divisor-sum n)
  (let loop ((d 1) (sum 0))
    (cond ((> (* d d) n) sum)
          ((= 0 (remainder n d))
           (let ((other (quotient n d)))
             (loop (+ d 1)
                   (cond ((= d other) (+ sum d))
                         ((= d 1) (+ sum d))
                         (else (+ sum d other))))))
          (else (loop (+ d 1) sum)))))

(define (perfect? n)
  (and (> n 1) (= n (divisor-sum n))))

(define (range a b)
  (if (> a b) '() (cons a (range (+ a 1) b))))

(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

(display (filter perfect? (range 1 10000)))
(newline)
