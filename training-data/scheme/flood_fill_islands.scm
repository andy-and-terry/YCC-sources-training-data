;; Number of islands via flood fill: scan the grid, and whenever an
;; unvisited land cell (1) is found, flood-fill the whole connected
;; island so it is never counted again.

(define (grid-ref grid r c rows cols)
  (if (and (>= r 0) (< r rows) (>= c 0) (< c cols))
      (vector-ref (vector-ref grid r) c)
      0))

(define (flood-fill! grid r c rows cols)
  (when (= 1 (grid-ref grid r c rows cols))
    (vector-set! (vector-ref grid r) c 0)
    (flood-fill! grid (- r 1) c rows cols)
    (flood-fill! grid (+ r 1) c rows cols)
    (flood-fill! grid r (- c 1) rows cols)
    (flood-fill! grid r (+ c 1) rows cols)))

(define (count-islands grid)
  (let* ((rows (vector-length grid)) (cols (vector-length (vector-ref grid 0))))
    (let loop ((r 0) (count 0))
      (if (= r rows)
          count
          (loop (+ r 1)
                (let cloop ((c 0) (acc count))
                  (if (= c cols)
                      acc
                      (if (= 1 (grid-ref grid r c rows cols))
                          (begin (flood-fill! grid r c rows cols) (cloop (+ c 1) (+ acc 1)))
                          (cloop (+ c 1) acc)))))))))

(define island-grid
  (vector (vector 1 1 0 0 0)
          (vector 1 1 0 0 0)
          (vector 0 0 1 0 0)
          (vector 0 0 0 1 1)))

(display (count-islands island-grid))
(newline)
