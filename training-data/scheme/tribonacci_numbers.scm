;; Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)

(define (tribonacci count)
  (let loop ((n count) (a 0) (b 0) (c 1) (acc '()))
    (if (= n 0)
        (reverse acc)
        (loop (- n 1) b c (+ a b c) (cons a acc)))))

(display "Tribonacci: ")
(display (tribonacci 15))
(newline)
