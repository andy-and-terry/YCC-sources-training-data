;; A doubly linked list of mutable nodes, each a 3-element vector: #(value prev next).

(define (make-node value) (vector value #f #f))
(define (node-value n) (vector-ref n 0))
(define (node-prev n) (vector-ref n 1))
(define (node-next n) (vector-ref n 2))
(define (node-prev-set! n p) (vector-set! n 1 p))
(define (node-next-set! n nx) (vector-set! n 2 nx))

;; A list is a 2-element vector: #(head tail)
(define (make-list) (vector #f #f))
(define (dll-head l) (vector-ref l 0))
(define (dll-tail l) (vector-ref l 1))

(define (dll-push-back! l value)
  (let ((node (make-node value)) (tail (dll-tail l)))
    (if tail
        (begin
          (node-prev-set! node tail)
          (node-next-set! tail node)
          (vector-set! l 1 node))
        (begin
          (vector-set! l 0 node)
          (vector-set! l 1 node)))))

(define (dll-push-front! l value)
  (let ((node (make-node value)) (head (dll-head l)))
    (if head
        (begin
          (node-next-set! node head)
          (node-prev-set! head node)
          (vector-set! l 0 node))
        (begin
          (vector-set! l 0 node)
          (vector-set! l 1 node)))))

(define (dll->list l)
  (let loop ((n (dll-head l)) (acc '()))
    (if n (loop (node-next n) (cons (node-value n) acc)) (reverse acc))))

(define (dll->list-reversed l)
  (let loop ((n (dll-tail l)) (acc '()))
    (if n (loop (node-prev n) (cons (node-value n) acc)) (reverse acc))))

(define lst (make-list))
(dll-push-back! lst 2)
(dll-push-back! lst 3)
(dll-push-front! lst 1)
(display (dll->list lst))
(newline)
(display (dll->list-reversed lst))
(newline)
