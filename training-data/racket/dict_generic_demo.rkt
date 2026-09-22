#lang racket

(require racket/dict)

;; racket/dict provides a uniform interface over hash tables,
;; association lists, and vectors of pairs -- code written against
;; dict-ref/dict-set/... works on any of them.
(define (total-value d)
  (for/sum ([(k v) (in-dict d)]) v))

(define h (hash "apples" 3 "pears" 5))
(define alist (list (cons "apples" 3) (cons "pears" 5)))

(displayln (total-value h))
(displayln (total-value alist))

(displayln (dict-ref h "apples"))
(displayln (dict-ref alist "pears"))
(displayln (dict-has-key? h "bananas"))

(define h2 (dict-set h "bananas" 8))
(displayln (dict-ref h2 "bananas"))
(displayln (sort (dict-keys h2) string<?))

(define alist2 (dict-remove alist "apples"))
(displayln alist2)
