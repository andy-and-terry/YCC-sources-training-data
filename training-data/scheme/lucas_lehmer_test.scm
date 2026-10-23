(define (prime? n)
  (and (>= n 2)
       (let loop ((d 2))
         (cond ((> (* d d) n) #t)
               ((= (remainder n d) 0) #f)
               (else (loop (+ d 1)))))))

(define (lucas-lehmer? p)
  (if (= p 2)
      #t
      (let ((m (- (expt 2 p) 1)))
        (let loop ((i 0) (s 4))
          (if (= i (- p 2))
              (= s 0)
              (loop (+ i 1) (modulo (- (* s s) 2) m)))))))

(define (exponents p)
  (cond ((> p 19) '())
        ((and (prime? p) (lucas-lehmer? p)) (cons p (exponents (+ p 1))))
        (else (exponents (+ p 1)))))

(define (print-list lst)
  (if (not (null? lst))
      (begin
        (display (car lst))
        (for-each (lambda (x) (display " ") (display x)) (cdr lst))))
  (newline))

(print-list (exponents 2))
