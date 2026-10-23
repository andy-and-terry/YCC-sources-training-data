(define (digit-sum n)
  (if (< n 10)
      n
      (+ (remainder n 10) (digit-sum (quotient n 10)))))

;; sum of digit sums of the prime factors, with multiplicity,
;; and the number of prime factors, returned as a pair
(define (factor-info n)
  (let loop ((m n) (p 2) (sum 0) (count 0))
    (cond ((= m 1) (cons sum count))
          ((> (* p p) m) (cons (+ sum (digit-sum m)) (+ count 1)))
          ((= (remainder m p) 0)
           (loop (quotient m p) p (+ sum (digit-sum p)) (+ count 1)))
          (else (loop m (+ p 1) sum count)))))

(define (smith? n)
  (let ((info (factor-info n)))
    (and (> (cdr info) 1)
         (= (car info) (digit-sum n)))))

(define (smiths-from n)
  (cond ((>= n 100) '())
        ((smith? n) (cons n (smiths-from (+ n 1))))
        (else (smiths-from (+ n 1)))))

(define (print-list lst)
  (if (not (null? lst))
      (begin
        (display (car lst))
        (for-each (lambda (x) (display " ") (display x)) (cdr lst))))
  (newline))

(print-list (smiths-from 4))
