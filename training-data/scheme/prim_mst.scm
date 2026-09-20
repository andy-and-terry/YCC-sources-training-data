;; Prim's minimum spanning tree over a graph represented as an
;; association list: node -> ((neighbor . weight) ...).

(define graph
  '((a . ((b . 2) (c . 3)))
    (b . ((a . 2) (c . 1) (d . 4)))
    (c . ((a . 3) (b . 1) (d . 5)))
    (d . ((b . 4) (c . 5)))))

(define (neighbors node)
  (let ((entry (assq node graph)))
    (if entry (cdr entry) '())))

(define (all-nodes) (map car graph))

(define (min-edge edges)
  (fold-left (lambda (best e) (if (< (cdr e) (cdr best)) e best))
             (car edges) (cdr edges)))

(define (prim start)
  (let loop ((visited (list start)) (mst '()))
    (if (= (length visited) (length (all-nodes)))
        (reverse mst)
        (let* ((candidates
                (apply append
                       (map (lambda (v)
                              (filter (lambda (e) (not (member (car e) visited)))
                                      (map (lambda (e) (cons (cons v (car e)) (cdr e)))
                                           (neighbors v))))
                            visited)))
               (best (min-edge candidates))
               (next-node (cdr (car best))))
          (loop (cons next-node visited) (cons best mst))))))

(display (prim 'a))
(newline)
