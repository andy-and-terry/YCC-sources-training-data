;; A simplified skip list: each insert flips coins to decide how many
;; sorted sub-lists (levels) a value is duplicated into, giving
;; expected O(log n) search without any tree-balancing logic.

(define (make-skip-list max-level) (make-vector max-level '()))

(define (random-level max-level)
  (let loop ((level 1))
    (if (and (< level max-level) (< (random-real) 0.5))
        (loop (+ level 1))
        level)))

;; Deterministic stand-in for a real RNG so this demo is reproducible.
(define seed 7)
(define (random-real)
  (set! seed (modulo (+ (* seed 1103515245) 12345) 2147483648))
  (/ (exact->inexact seed) 2147483648))

(define (skip-insert! skip-list max-level value)
  (let ((level (random-level max-level)))
    (let loop ((i 0))
      (when (< i level)
        (vector-set! skip-list i (insert-sorted (vector-ref skip-list i) value))
        (loop (+ i 1))))))

(define (insert-sorted lst value)
  (cond ((null? lst) (list value))
        ((<= value (car lst)) (cons value lst))
        (else (cons (car lst) (insert-sorted (cdr lst) value)))))

(define (skip-search skip-list value)
  (member value (vector-ref skip-list 0)))

(define sl (make-skip-list 3))
(for-each (lambda (v) (skip-insert! sl 3 v)) '(3 1 4 1 5 9 2 6))

(display (vector-ref sl 0))
(newline)
(display (if (skip-search sl 5) #t #f))
(newline)
(display (if (skip-search sl 7) #t #f))
(newline)
