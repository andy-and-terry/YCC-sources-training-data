#lang racket
(require racket/date)

(define (slow-sum n) (for/sum ([i (in-range n)]) i))

(define-values (results cpu real gc) (time-apply slow-sum '(100000)))
(displayln results)
(displayln (and (>= cpu 0) (>= real 0) (>= gc 0)))

(define start (current-inexact-milliseconds))
(slow-sum 100000)
(define elapsed (- (current-inexact-milliseconds) start))
(displayln (>= elapsed 0))

(displayln (exact? (current-seconds)))
(displayln (date? (seconds->date 0 #f)))
(displayln (date-year (seconds->date 0 #f)))
(displayln (date->string (seconds->date 86400 #f)))
(displayln (> (current-process-milliseconds) -1))
(displayln (real? (current-gc-milliseconds)))
(define d (seconds->date 1700000000 #f))
(printf "~a-~a-~a\n" (date-year d) (date-month d) (date-day d))
