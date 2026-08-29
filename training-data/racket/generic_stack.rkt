#lang racket

(define (make-stack) (box '()))

(define (stack-push! s item)
  (set-box! s (cons item (unbox s))))

(define (stack-pop! s)
  (define top (car (unbox s)))
  (set-box! s (cdr (unbox s)))
  top)

(define s (make-stack))
(stack-push! s 1)
(stack-push! s 2)
(stack-push! s 3)
(displayln (stack-pop! s))
(displayln (stack-pop! s))
