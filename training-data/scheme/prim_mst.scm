;; Prim's algorithm for a minimum spanning tree over a small weighted
;; undirected graph, represented as an adjacency list of
;; (node . ((neighbor . weight) ...)).

(define graph
  '((a . ((b . 2) (c . 3)))
    (b . ((a . 2) (c . 1) (d . 4)))
    (c . ((a . 3) (b . 1) (d . 5)))
    (d . ((b . 4) (c . 5)))))

(define (neighbors g node) (cdr (assq node g)))
(define (all-nodes g) (map car g))

;; Find the minimum-weight edge crossing from `visited` to an unvisited node.
(define (min-crossing-edge g visited)
  (fold-left
   (lambda (best u)
     (fold-left
      (lambda (best2 edge)
        (let ((v (car edge)) (w (cdr edge)))
          (if (and (not (member v visited))
                   (or (not best2) (< w (caddr best2))))
              (list u v w)
              best2)))
      best
      (neighbors g u)))
   #f
   visited))

(define (prim-mst g start)
  (let loop ((visited (list start)) (edges '()))
    (if (= (length visited) (length (all-nodes g)))
        (reverse edges)
        (let ((edge (min-crossing-edge g visited)))
          (if (not edge)
              (reverse edges) ; disconnected graph
              (loop (cons (cadr edge) visited) (cons edge edges)))))))

(display (prim-mst graph 'a))
(newline)
