;; Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
(define (padovan count)
  (let loop ((n count) (a 1) (b 1) (c 1) (acc '()))
    (if (= n 0)
        (reverse acc)
        (loop (- n 1) b c (+ a b) (cons a acc)))))

(for-each (lambda (x) (display x) (display " ")) (padovan 15))
(newline)
