#lang racket

(define graph (hash "a" '("b" "c") "b" '("d") "c" '("d") "d" '("e") "e" '()))

(define (bfs start)
  (define visited (make-hash (list (cons start #t))))
  (let loop ([queue (list start)] [order '()])
    (if (null? queue)
        (reverse order)
        (let* ([node (car queue)]
               [neighbors (filter (lambda (n) (not (hash-has-key? visited n)))
                                   (hash-ref graph node '()))])
          (for ([n neighbors]) (hash-set! visited n #t))
          (loop (append (cdr queue) neighbors) (cons node order))))))

(define (dfs start)
  (define visited (make-hash))
  (define order '())
  (define (visit node)
    (unless (hash-has-key? visited node)
      (hash-set! visited node #t)
      (set! order (cons node order))
      (for ([n (hash-ref graph node '())]) (visit n))))
  (visit start)
  (reverse order))

(displayln (bfs "a"))
(displayln (dfs "a"))
