;; Bipartite check via two-coloring BFS: a graph is bipartite exactly
;; when no edge ever connects two nodes forced to the same color.

(define graph '((a . (b d)) (b . (a c)) (c . (b d)) (d . (a c))))

(define (neighbors g node)
  (let ((entry (assq node g)))
    (if entry (cdr entry) '())))

(define (bipartite? g nodes)
  (let loop ((colors '()) (remaining nodes))
    (cond ((null? remaining) #t)
          ((assq (car remaining) colors) (loop colors (cdr remaining)))
          (else
           (let ((result (color-from g (car remaining) 1 colors)))
             (if result (loop result (cdr remaining)) #f))))))

(define (color-from g start color colors)
  (bfs-color g (list (cons start color)) colors))

(define (bfs-color g queue colors)
  (if (null? queue)
      colors
      (let* ((pair (car queue)) (node (car pair)) (color (cdr pair)))
        (if (assq node colors)
            (if (= (cdr (assq node colors)) color)
                (bfs-color g (cdr queue) colors)
                #f)
            (let ((new-colors (cons pair colors))
                  (next (map (lambda (n) (cons n (- color))) (neighbors g node))))
              (bfs-color g (append (cdr queue) next) new-colors))))))

(display (bipartite? graph '(a b c d)))
(newline)
(display (bipartite? '((a . (b c)) (b . (a c)) (c . (a b))) '(a b c)))
(newline)
