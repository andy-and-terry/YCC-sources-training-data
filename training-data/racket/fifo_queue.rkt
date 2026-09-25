#lang racket

;; A functional FIFO queue backed by two lists: a front list to pop
;; from and a reversed back list to push onto, giving amortized O(1)
;; enqueue/dequeue without any mutation.
(struct queue (front back) #:transparent)

(define empty-queue (queue '() '()))

(define (enqueue q v)
  (queue (queue-front q) (cons v (queue-back q))))

(define (normalize q)
  (if (null? (queue-front q))
      (queue (reverse (queue-back q)) '())
      q))

(define (dequeue q)
  (define n (normalize q))
  (values (car (queue-front n)) (queue (cdr (queue-front n)) (queue-back n))))

(define (queue-empty? q)
  (and (null? (queue-front q)) (null? (queue-back q))))

(define q1 (enqueue (enqueue (enqueue empty-queue 1) 2) 3))
(define-values (first rest) (dequeue q1))
(displayln first)
(define-values (second rest2) (dequeue rest))
(displayln second)
(displayln (queue-empty? rest2))
