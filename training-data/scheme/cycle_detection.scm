(define graph
  '((a . (b)) (b . (c)) (c . (a)) (d . (e)) (e . ())))

(define (neighbors node)
  (let ((entry (assq node graph)))
    (if entry (cdr entry) '())))

(define (all-nodes) (map car graph))

(define (get-state states node)
  (let ((entry (assq node states)))
    (if entry (cdr entry) 'unvisited)))

(define (set-state states node value)
  (cons (cons node value) (filter (lambda (e) (not (eq? (car e) node))) states)))

;; Depth-first visit that threads the states alist through the recursion.
;; Returns 'cycle-found the moment a back-edge into an in-progress node is
;; seen, otherwise returns the updated states alist.
(define (visit node states)
  (let ((state (get-state states node)))
    (cond
      ((eq? state 'in-progress) 'cycle-found)
      ((eq? state 'done) states)
      (else
       (let ((states1 (set-state states node 'in-progress)))
         (let visit-neighbors ((ns (neighbors node)) (states states1))
           (if (null? ns)
               (set-state states node 'done)
               (let ((result (visit (car ns) states)))
                 (if (eq? result 'cycle-found)
                     'cycle-found
                     (visit-neighbors (cdr ns) result))))))))))

(define (has-cycle?)
  (let loop ((remaining (all-nodes)) (states '()))
    (cond
      ((null? remaining) #f)
      ((eq? (get-state states (car remaining)) 'done) (loop (cdr remaining) states))
      (else
       (let ((result (visit (car remaining) states)))
         (if (eq? result 'cycle-found)
             #t
             (loop (cdr remaining) result)))))))

(display (has-cycle?))
(newline)
