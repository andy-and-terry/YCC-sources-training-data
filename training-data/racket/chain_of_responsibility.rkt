#lang racket

;; Each handler is a procedure of (amount) -> (list-of-denominations) or #f
;; if it cannot help; chained via a list, tried in order.
(define (make-handler denomination next)
  (lambda (amount)
    (cond
      [(zero? amount) '()]
      [(>= amount denomination)
       (define count (quotient amount denomination))
       (define left-over (remainder amount denomination))
       (define rest-result
         (cond [(zero? left-over) '()]
               [next (next left-over)]
               [else (list left-over)]))
       (append (make-list count denomination) rest-result)]
      [next (next amount)]
      [else (list amount)])))

(define chain
  (make-handler 25 (make-handler 10 (make-handler 5 (make-handler 1 #f)))))

(displayln (chain 63))
(displayln (chain 99))
