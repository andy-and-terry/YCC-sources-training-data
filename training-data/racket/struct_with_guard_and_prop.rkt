#lang racket
(struct account (owner balance) #:transparent)
(define (deposit a n) (struct-copy account a [balance (+ (account-balance a) n)]))
(displayln (deposit (account "ann" 10) 5))
