#lang racket

;; Racket's lightweight green threads communicate safely through
;; channels instead of shared mutable state.
(define results (make-channel))

(define (worker id n)
  (thread
   (lambda ()
     (channel-put results (cons id (* n n))))))

(for ([i (in-range 5)])
  (worker i i))

(define collected
  (for/list ([_ (in-range 5)])
    (channel-get results)))

(displayln (sort collected < #:key car))

;; thread-wait blocks until a specific thread finishes.
(define total (box 0))
(define t
  (thread (lambda ()
            (for ([n (in-range 1 6)])
              (set-box! total (+ (unbox total) n))))))
(thread-wait t)
(displayln (unbox total))
