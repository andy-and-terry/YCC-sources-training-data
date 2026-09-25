#lang racket

;; A simplified skip list: each node keeps a vector of "forward"
;; pointers, one per level, so search can skip past many elements at
;; higher levels instead of visiting every node in sequence.
(define max-level 4)

(struct node (value forward) #:mutable #:transparent)

(define (make-node value level)
  (node value (make-vector (add1 level) #f)))

(define header (make-node -inf.0 max-level))

(define (random-level)
  (let loop ([lvl 0])
    (if (and (< lvl max-level) (zero? (random 2)))
        (loop (add1 lvl))
        lvl)))

(define (skip-insert! value)
  (define level (random-level))
  (define new-node (make-node value level))
  (let loop ([lvl max-level] [cur header])
    (when (>= lvl 0)
      (let scan ([cur cur])
        (define next (vector-ref (node-forward cur) lvl))
        (if (and next (< (node-value next) value))
            (scan next)
            (begin
              (when (<= lvl level)
                (vector-set! (node-forward new-node) lvl next)
                (vector-set! (node-forward cur) lvl new-node))
              (loop (sub1 lvl) cur)))))))

(define (skip-search value)
  (let loop ([lvl max-level] [cur header])
    (cond
      [(< lvl 0) #f]
      [else
       (define next (vector-ref (node-forward cur) lvl))
       (cond
         [(and next (= (node-value next) value)) #t]
         [(and next (< (node-value next) value)) (loop lvl next)]
         [else (loop (sub1 lvl) cur)])])))

(for ([v '(3 6 7 9 12 19 17)]) (skip-insert! v))
(displayln (skip-search 19))
(displayln (skip-search 15))
