(define graph
  '((a . ((b . 1) (c . 4)))
    (b . ((c . 2) (d . 5)))
    (c . ((d . 1)))
    (d . ())))

(define (get-dist dist-alist node)
  (let ((entry (assq node dist-alist)))
    (if entry (cdr entry) 999999)))

(define (set-dist dist-alist node val)
  (cons (cons node val) (filter (lambda (e) (not (eq? (car e) node))) dist-alist)))

(define (dijkstra source)
  (define nodes (map car graph))
  (define dist (map (lambda (n) (cons n 999999)) nodes))
  (define dist1 (set-dist dist source 0))
  (let loop ((dist dist1) (visited '()) (count (length nodes)))
    (if (= count 0)
        dist
        (let* ((unvisited (filter (lambda (n) (not (member n visited))) nodes))
               (best-node (car (sort unvisited (lambda (a b) (< (get-dist dist a) (get-dist dist b))))))
               (best-dist (get-dist dist best-node))
               (edges (cdr (assq best-node graph)))
               (new-dist (fold-left (lambda (d edge)
                                       (let* ((neighbor (car edge)) (weight (cdr edge))
                                              (new-d (+ best-dist weight)))
                                         (if (< new-d (get-dist d neighbor)) (set-dist d neighbor new-d) d)))
                                     dist edges)))
          (loop new-dist (cons best-node visited) (- count 1))))))

(display (dijkstra 'a))
(newline)
