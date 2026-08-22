(define (is-prime? n)
  (define (check d)
    (cond
      ((> (* d d) n) #t)
      ((= (modulo n d) 0) #f)
      (else (check (+ d 1)))))
  (and (> n 1) (check 2)))

(display (filter is-prime? (iota 19 2)))
(newline)
