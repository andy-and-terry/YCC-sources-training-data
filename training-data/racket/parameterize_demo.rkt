#lang racket

;; Parameters give thread-local, dynamically-scoped configuration that
;; is automatically restored when `parameterize` exits.
(define current-currency (make-parameter "USD"))
(define current-discount (make-parameter 0.0))

(define (format-price amount)
  (define discounted (* amount (- 1 (current-discount))))
  (format "~a~a" (real->decimal-string discounted 2) (current-currency)))

(displayln (format-price 100))

(parameterize ([current-currency "EUR"] [current-discount 0.1])
  (displayln (format-price 100))
  (parameterize ([current-discount 0.25])
    (displayln (format-price 100))))

;; Back to the defaults outside the parameterize blocks.
(displayln (format-price 100))
