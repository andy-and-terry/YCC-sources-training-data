#lang racket

;; An association list pairs keys with values as a plain list of
;; pairs -- simple and immutable, at the cost of O(n) lookup.

(define inventory (list (cons 'apples 10) (cons 'bananas 5) (cons 'cherries 20)))

(displayln (assoc 'bananas inventory))
(displayln (cdr (assoc 'bananas inventory)))
(displayln (assoc 'grapes inventory))

(define (update-quantity alist key delta)
  (map (lambda (pair)
         (if (eq? (car pair) key)
             (cons key (+ (cdr pair) delta))
             pair))
       alist))

(define updated (update-quantity inventory 'apples -3))
(displayln updated)

(displayln (map car inventory))
(displayln (map cdr inventory))
