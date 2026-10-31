(define (alternating-digit-sum n)
  (let loop ((n n) (sign 1) (total 0))
    (if (= n 0)
        total
        (loop (quotient n 10) (- sign) (+ total (* sign (remainder n 10)))))))

(for-each (lambda (n)
            (display n) (display " ")
            (display (alternating-digit-sum n)) (newline))
          '(1234 99999 1000))
