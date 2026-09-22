;; Kruskal's algorithm for a minimum spanning tree, using union-find
;; over an explicit edge list of (u v weight) triples.

(define edges
  '((a b 2) (a c 3) (b c 1) (b d 4) (c d 5)))

(define (make-parent nodes)
  (map (lambda (n) (cons n n)) nodes))

(define (find parent x)
  (let ((p (cdr (assq x parent))))
    (if (eq? p x) x (find parent p))))

(define (union parent x y)
  (let ((rx (find parent x)) (ry (find parent y)))
    (map (lambda (pair)
           (if (eq? (cdr pair) rx) (cons (car pair) ry) pair))
         parent)))

;; Insertion sort of edges by ascending weight (avoids relying on a
;; built-in `sort`, which isn't part of the R7RS base library).
(define (insert-edge edge lst)
  (cond ((null? lst) (list edge))
        ((< (caddr edge) (caddr (car lst))) (cons edge lst))
        (else (cons (car lst) (insert-edge edge (cdr lst))))))

(define (sort-edges lst)
  (if (null? lst)
      '()
      (insert-edge (car lst) (sort-edges (cdr lst)))))

(define (kruskal-mst nodes edges)
  (let ((sorted (sort-edges edges)))
    (let loop ((es sorted) (parent (make-parent nodes)) (acc '()) (total 0))
      (if (null? es)
          (cons (reverse acc) total)
          (let* ((edge (car es)) (u (car edge)) (v (cadr edge)) (w (caddr edge)))
            (if (eq? (find parent u) (find parent v))
                (loop (cdr es) parent acc total)
                (loop (cdr es) (union parent u v) (cons edge acc) (+ total w))))))))

(define result (kruskal-mst '(a b c d) edges))
(display (car result))
(newline)
(display (cdr result))
(newline)
