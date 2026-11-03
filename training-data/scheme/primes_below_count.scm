(define (sieve lst)
  (if (null? lst)
      '()
      (let ((p (car lst)))
        (cons p (sieve (filter (lambda (x) (not (= 0 (remainder x p)))) (cdr lst)))))))

(define (iota-from a b)
  (if (> a b) '() (cons a (iota-from (+ a 1) b))))

(define (count-primes-below n)
  (length (sieve (iota-from 2 (- n 1)))))

(display (count-primes-below 100))
(newline)
