;; Fibbinary numbers: no two adjacent 1 bits (checked via repeated halving).
(define (fibbinary? n)
  (let loop ((m n) (prev 0))
    (cond ((= m 0) #t)
          ((and (= prev 1) (odd? m)) #f)
          (else (loop (quotient m 2) (remainder m 2))))))

(do ((n 0 (+ n 1))) ((>= n 50))
  (if (fibbinary? n) (begin (display n) (display " "))))
(newline)
