#lang racket

;; A counting semaphore limits concurrent access to a resource.
(define sem (make-semaphore 2))
(define active 0)
(define max-active 0)
(define guard (make-semaphore 1))

(define (work id)
  (semaphore-wait sem)
  (semaphore-wait guard)
  (set! active (add1 active))
  (set! max-active (max max-active active))
  (semaphore-post guard)
  (sleep 0.02)
  (semaphore-wait guard)
  (set! active (sub1 active))
  (semaphore-post guard)
  (semaphore-post sem))

(define threads (for/list ([i 6]) (thread (lambda () (work i)))))
(for-each thread-wait threads)
(printf "max concurrent: ~a\n" max-active)
