;; Greedy backtracking graph coloring: assign each vertex the smallest
;; color that no adjacent vertex already uses, trying more colors only
;; if a valid assignment cannot be completed.

(define (neighbors graph v) (cdr (assv v graph)))

(define (safe-color? graph colors v c)
  (not (any (lambda (n) (= (vector-ref colors n) c)) (neighbors graph v))))

(define (any pred lst)
  (cond ((null? lst) #f)
        ((pred (car lst)) #t)
        (else (any pred (cdr lst)))))

(define (color-graph graph n-vertices max-colors)
  (define colors (make-vector n-vertices -1))
  (define (try-vertex v)
    (if (= v n-vertices)
        #t
        (let try-color ((c 0))
          (cond
            ((= c max-colors) #f)
            ((and (safe-color? graph colors v c)
                  (begin (vector-set! colors v c) (try-vertex (+ v 1))))
             #t)
            (else (vector-set! colors v -1) (try-color (+ c 1)))))))
  (if (try-vertex 0) colors #f))

;; A 4-cycle plus one diagonal (0-2), needing 3 colors.
(define graph '((0 . (1 2 3)) (1 . (0 2)) (2 . (0 1 3)) (3 . (0 2))))

(display (color-graph graph 4 3))
(newline)
(display (color-graph graph 4 2))
(newline)
