#lang racket
(require racket/future)

;; Futures may run in parallel on OS threads; touch waits for the result.
(define (fib n)
  (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))

(define fs (for/list ([n '(20 21 22 23)])
             (future (lambda () (fib n)))))
(displayln (map touch fs))
(displayln (processor-count))
