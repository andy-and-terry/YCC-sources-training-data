#lang racket

;; A mutable doubly linked list using boxes for prev/next links.
(struct dnode (value prev next) #:mutable #:transparent)

(define (make-dlist)
  (box (cons #f #f)))  ;; (head . tail)

(define (dlist-push-back! lst value)
  (define n (dnode value #f #f))
  (define pair (unbox lst))
  (cond
    [(cdr pair)
     (set-dnode-prev! n (cdr pair))
     (set-dnode-next! (cdr pair) n)
     (set-box! lst (cons (car pair) n))]
    [else
     (set-box! lst (cons n n))]))

(define (dlist->list lst)
  (let loop ([node (car (unbox lst))] [acc '()])
    (if (not node)
        (reverse acc)
        (loop (dnode-next node) (cons (dnode-value node) acc)))))

(define (dlist->list-reversed lst)
  (let loop ([node (cdr (unbox lst))] [acc '()])
    (if (not node)
        (reverse acc)
        (loop (dnode-prev node) (cons (dnode-value node) acc)))))

(define dl (make-dlist))
(for ([v '(1 2 3 4)]) (dlist-push-back! dl v))

(displayln (dlist->list dl))
(displayln (dlist->list-reversed dl))
