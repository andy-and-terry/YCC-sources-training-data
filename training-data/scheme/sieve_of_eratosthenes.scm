(define (range a b)
  (if (> a b) '() (cons a (range (+ a 1) b))))

(define (sieve-helper candidates)
  (if (null? candidates)
      '()
      (let ((p (car candidates)))
        (cons p (sieve-helper (filter (lambda (x) (not (= 0 (remainder x p)))) (cdr candidates)))))))

(define (sieve limit)
  (sieve-helper (range 2 limit)))

(display (sieve 50))
(newline)
