(define (digit-square-sum n)
  (if (= n 0) 0
      (+ (* (remainder n 10) (remainder n 10))
         (digit-square-sum (quotient n 10)))))

(define (happy? n)
  (let loop ((n n) (seen '()))
    (cond ((= n 1) #t)
          ((member n seen) #f)
          (else (loop (digit-square-sum n) (cons n seen))))))

(let loop ((n 1) (acc '()))
  (if (> n 40)
      (begin (display (reverse acc)) (newline)) ; (1 7 10 13 19 23 28 31 32 44)
      (loop (+ n 1) (if (happy? n) (cons n acc) acc))))
