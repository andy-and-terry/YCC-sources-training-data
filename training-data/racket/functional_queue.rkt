#lang racket

;; A purely functional (Okasaki-style) queue: two lists, front and
;; back. Dequeue pops from front; enqueue conses onto back. Once
;; front runs dry it is replaced by (reverse back), which is what
;; gives amortized O(1) enqueue/dequeue despite full immutability.

(struct fqueue (front back) #:transparent)

(define empty-queue (fqueue '() '()))

(define (enqueue q value)
  (fqueue (fqueue-front q) (cons value (fqueue-back q))))

(define (normalize q)
  (if (null? (fqueue-front q))
      (fqueue (reverse (fqueue-back q)) '())
      q))

(define (dequeue q)
  (define normalized (normalize q))
  (when (null? (fqueue-front normalized))
    (error 'dequeue "queue is empty"))
  (values (car (fqueue-front normalized))
          (fqueue (cdr (fqueue-front normalized)) (fqueue-back normalized))))

(define (queue->list q)
  (append (fqueue-front q) (reverse (fqueue-back q))))

(define q1 (enqueue (enqueue (enqueue empty-queue 1) 2) 3))
(displayln (queue->list q1))

(define-values (first rest) (dequeue q1))
(displayln first)
(displayln (queue->list rest))

(define q2 (enqueue rest 4))
(let loop ([q q2])
  (unless (null? (queue->list q))
    (define-values (v next) (dequeue q))
    (displayln v)
    (loop next)))
