#lang racket

(define (make-min-stack)
  (box (list (list) (list)))) ; (stack . min-stack)

(define (min-stack-push! ms value)
  (define stack (first (unbox ms)))
  (define min-stack (second (unbox ms)))
  (define current-min (if (null? min-stack) value (min value (first min-stack))))
  (set-box! ms (list (cons value stack) (cons current-min min-stack))))

(define (min-stack-pop! ms)
  (define stack (first (unbox ms)))
  (define min-stack (second (unbox ms)))
  (set-box! ms (list (rest stack) (rest min-stack))))

(define (min-stack-min ms)
  (first (second (unbox ms))))

(define s (make-min-stack))
(min-stack-push! s 5)
(min-stack-push! s 2)
(min-stack-push! s 7)
(displayln (min-stack-min s)) ; 2
(min-stack-pop! s)
(displayln (min-stack-min s)) ; 2
(min-stack-pop! s)
(displayln (min-stack-min s)) ; 5
