;; Strategy pattern: the algorithm itself is just a passed-in closure,
;; so "swapping strategies" is swapping which procedure gets applied.

(define (no-discount amount) amount)
(define (percentage-discount percent) (lambda (amount) (* amount (- 1 (/ percent 100)))))
(define (flat-discount flat) (lambda (amount) (max 0 (- amount flat))))

(define (checkout-total strategy amount) (strategy amount))

(define strategies (list no-discount (percentage-discount 10) (flat-discount 5)))

(for-each (lambda (strategy) (display (checkout-total strategy 100)) (newline)) strategies)
