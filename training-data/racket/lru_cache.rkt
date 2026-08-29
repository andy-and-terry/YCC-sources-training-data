#lang racket

(define (make-lru-cache capacity)
  (box (list capacity (make-hash) '())))

(define (lru-get cache key)
  (match-define (list capacity map order) (unbox cache))
  (if (hash-has-key? map key)
      (begin
        (set-box! cache (list capacity map (cons key (remove key order))))
        (hash-ref map key))
      -1))

(define (lru-put! cache key value)
  (match-define (list capacity map order) (unbox cache))
  (hash-set! map key value)
  (define new-order (cons key (remove key order)))
  (if (> (length new-order) capacity)
      (let ([evict (last new-order)])
        (hash-remove! map evict)
        (set-box! cache (list capacity map (remove evict new-order))))
      (set-box! cache (list capacity map new-order))))

(require racket/match)
(define cache (make-lru-cache 2))
(lru-put! cache 1 1)
(lru-put! cache 2 2)
(displayln (lru-get cache 1))
(lru-put! cache 3 3)
(displayln (lru-get cache 2))
