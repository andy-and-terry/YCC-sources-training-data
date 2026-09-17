#lang racket

;; graph: a hash mapping each node to a list of its neighbors.
(define (bipartite? graph)
  (define color (make-hash))

  (define (bfs-ok? start)
    (hash-set! color start 0)
    (let loop ([queue (list start)])
      (cond
        [(null? queue) #t]
        [else
         (define node (car queue))
         (define to-visit '())
         (define conflict? #f)
         (for ([neighbor (hash-ref graph node)])
           (cond
             [(not (hash-has-key? color neighbor))
              (hash-set! color neighbor (- 1 (hash-ref color node)))
              (set! to-visit (cons neighbor to-visit))]
             [(= (hash-ref color neighbor) (hash-ref color node))
              (set! conflict? #t)]))
         (if conflict?
             #f
             (loop (append (cdr queue) to-visit)))])))

  (for/and ([start (in-hash-keys graph)])
    (or (hash-has-key? color start) (bfs-ok? start))))

(define even-cycle (hash 0 '(1 3) 1 '(0 2) 2 '(1 3) 3 '(0 2)))
(define odd-cycle (hash 0 '(1 2) 1 '(0 2) 2 '(0 1)))

(displayln (bipartite? even-cycle))
(displayln (bipartite? odd-cycle))
