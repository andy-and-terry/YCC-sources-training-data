(define (subset-sum? nums target)
  (cond
    ((= target 0) #t)
    ((null? nums) #f)
    ((> (car nums) target) (subset-sum? (cdr nums) target))
    (else (or (subset-sum? (cdr nums) target)
              (subset-sum? (cdr nums) (- target (car nums)))))))

(display (subset-sum? '(3 34 4 12 5 2) 9))
(newline)
(display (subset-sum? '(3 34 4 12 5 2) 10))
(newline)
