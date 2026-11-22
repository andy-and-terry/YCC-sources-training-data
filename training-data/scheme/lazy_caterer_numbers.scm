;; Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
(define (show-all lst)
  (for-each (lambda (x) (display x) (display " ")) lst)
  (newline))

(show-all (let loop ((n 9) (acc '()))
            (if (< n 0) acc
                (loop (- n 1) (cons (+ 1 (quotient (* n (+ n 1)) 2)) acc)))))
