;; Sum of multiples of given numbers below a limit, via filter and fold.

(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

(define (iota* lo hi)
  (if (>= lo hi) '() (cons lo (iota* (+ lo 1) hi))))

(define (multiple-of-any? n divisors)
  (cond ((null? divisors) #f)
        ((= 0 (remainder n (car divisors))) #t)
        (else (multiple-of-any? n (cdr divisors)))))

(define (sum-of-multiples divisors limit)
  (apply + (filter (lambda (n) (multiple-of-any? n divisors))
                   (iota* 1 limit))))

(display (sum-of-multiples '(3 5) 10)) (newline)
(display (sum-of-multiples '(3 5) 1000)) (newline)
(display (sum-of-multiples '(7 13 17) 20)) (newline)
