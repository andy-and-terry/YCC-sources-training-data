(define (digit-product n)
  (if (= n 0) 1 (* (remainder n 10) (digit-product (quotient n 10)))))

(define (persistence n)
  (if (< n 10) 0 (+ 1 (persistence (digit-product n)))))

(for-each (lambda (n)
            (display n) (display " ")
            (display (persistence n)) (newline))
          '(39 77 999 10))
