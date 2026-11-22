;; Practical numbers: every m in 1..n is a sum of distinct divisors of n.
(define (practical? n)
  ;; bit i set <=> i is a subset sum of the divisors
  (let loop ((d 1) (reach 1))
    (if (> d n)
        (let ((mask (- (expt 2 (+ n 1)) 1)))
          (= (bitwise-and reach mask) mask))
        (loop (+ d 1)
              (if (zero? (remainder n d))
                  (bitwise-ior reach (* reach (expt 2 d)))
                  reach)))))

(do ((n 1 (+ n 1))) ((> n 40))
  (if (practical? n) (begin (display n) (display " "))))
(newline)
