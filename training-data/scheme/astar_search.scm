;; A* search on a grid (0 = open, 1 = wall), using Manhattan distance
;; as the heuristic. State is kept in simple association lists updated
;; via set! for clarity, since this is a small illustrative solver
;; rather than a performance-tuned one.

(define grid
  #(#(0 0 0 0 0)
    #(0 1 1 1 0)
    #(0 0 0 1 0)
    #(1 1 0 1 0)
    #(0 0 0 0 0)))

(define (grid-rows) (vector-length grid))
(define (grid-cols) (vector-length (vector-ref grid 0)))

(define (walkable? pos)
  (let ((r (car pos)) (c (cdr pos)))
    (and (>= r 0) (< r (grid-rows))
         (>= c 0) (< c (grid-cols))
         (= 0 (vector-ref (vector-ref grid r) c)))))

(define (heuristic a b)
  (+ (abs (- (car a) (car b))) (abs (- (cdr a) (cdr b)))))

(define (neighbors-of pos)
  (let ((r (car pos)) (c (cdr pos)))
    (filter walkable?
            (list (cons (- r 1) c) (cons (+ r 1) c)
                  (cons r (- c 1)) (cons r (+ c 1))))))

(define (assoc-ref alist key default)
  (let ((entry (assoc key alist)))
    (if entry (cdr entry) default)))

(define (assoc-set alist key value)
  (cons (cons key value) (filter (lambda (p) (not (equal? (car p) key))) alist)))

(define (astar start goal)
  (let ((open (list start))
        (came-from '())
        (g-score (list (cons start 0))))
    (let loop ()
      (if (null? open)
          #f
          (let ((current (car (sort open (lambda (a b)
                                            (< (+ (assoc-ref g-score a 999999) (heuristic a goal))
                                               (+ (assoc-ref g-score b 999999) (heuristic b goal))))))))
            (if (equal? current goal)
                (let build ((node current) (path (list current)))
                  (let ((prev (assoc node came-from)))
                    (if prev (build (cdr prev) (cons (cdr prev) path)) path)))
                (begin
                  (set! open (filter (lambda (n) (not (equal? n current))) open))
                  (for-each
                   (lambda (n)
                     (let ((tentative-g (+ (assoc-ref g-score current 999999) 1)))
                       (if (< tentative-g (assoc-ref g-score n 999999))
                           (begin
                             (set! came-from (assoc-set came-from n current))
                             (set! g-score (assoc-set g-score n tentative-g))
                             (if (not (member n open)) (set! open (cons n open)))))))
                   (neighbors-of current))
                  (loop))))))))

(display (astar (cons 0 0) (cons 4 4)))
(newline)
