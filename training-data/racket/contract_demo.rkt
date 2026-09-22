#lang racket

(require racket/contract)

(provide (contract-out
          [safe-divide (-> number? (and/c number? (not/c zero?)) number?)]
          [make-account (-> (>=/c 0) (-> symbol? real? any))]))

(define (safe-divide a b)
  (/ a b))

(define (make-account balance)
  (lambda (msg amount)
    (case msg
      [(deposit) (set! balance (+ balance amount)) balance]
      [(withdraw) (set! balance (- balance amount)) balance]
      [(balance) balance]
      [else (error "unknown message")])))

(displayln (safe-divide 10 2))

(define acc (make-account 100))
(displayln (acc 'deposit 50))
(displayln (acc 'balance 0))
