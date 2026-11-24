;; Moebius function: 0 if n has a squared prime factor, else (-1)^k.
(define (mobius n)
  (let loop ((m n) (p 2) (acc 1))
    (cond ((> (* p p) m) (if (> m 1) (- acc) acc))
          ((= 0 (remainder m p))
           (let ((m2 (quotient m p)))
             (if (= 0 (remainder m2 p)) 0 (loop m2 (+ p 1) (- acc)))))
          (else (loop m (+ p 1) acc)))))

(do ((n 1 (+ n 1))) ((> n 30))
  (display (mobius n)) (display " "))
(newline)
