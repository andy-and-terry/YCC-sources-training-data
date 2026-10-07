;; Objects as closures dispatching on message symbols.

(define (make-account balance)
  (define (deposit amt)
    (set! balance (+ balance amt))
    balance)
  (define (withdraw amt)
    (if (> amt balance)
        "insufficient funds"
        (begin (set! balance (- balance amt)) balance)))
  (define (dispatch msg . args)
    (cond ((eq? msg 'deposit) (apply deposit args))
          ((eq? msg 'withdraw) (apply withdraw args))
          ((eq? msg 'balance) balance)
          (else (error "unknown message" msg))))
  dispatch)

(define acc (make-account 100))
(write (acc 'deposit 50)) (newline)
(write (acc 'withdraw 30)) (newline)
(write (acc 'withdraw 500)) (newline)
(write (acc 'balance)) (newline)
