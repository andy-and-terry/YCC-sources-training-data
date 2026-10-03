#lang racket

(struct tree-type (name texture))

(define (make-tree-factory) (box (hash)))

(define (get-tree-type! factory name texture)
  (define key (cons name texture))
  (define cache (unbox factory))
  (cond
    [(hash-has-key? cache key) (hash-ref cache key)]
    [else
     (define t (tree-type name texture))
     (set-box! factory (hash-set cache key t))
     t]))

(define (render-tree t x y)
  (format "~a (~a) at (~a, ~a)" (tree-type-name t) (tree-type-texture t) x y))

(define factory (make-tree-factory))
(define placements '(("oak" "green" 1 2) ("oak" "green" 5 9) ("pine" "dark" 3 3)))

(for ([p placements])
  (define t (get-tree-type! factory (first p) (second p)))
  (displayln (render-tree t (third p) (fourth p))))

(printf "distinct flyweights cached: ~a\n" (hash-count (unbox factory)))
