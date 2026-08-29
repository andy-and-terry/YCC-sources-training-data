(define (make-parent n)
  (let ((vec (make-vector n)))
    (let loop ((i 0))
      (if (< i n) (begin (vector-set! vec i i) (loop (+ i 1)))))
    vec))

(define (uf-find parent x)
  (if (= (vector-ref parent x) x)
      x
      (uf-find parent (vector-ref parent x))))

(define (uf-union! parent x y)
  (let ((root-x (uf-find parent x))
        (root-y (uf-find parent y)))
    (if (not (= root-x root-y))
        (vector-set! parent root-x root-y))))

(define parent (make-parent 5))
(uf-union! parent 0 1)
(uf-union! parent 1 2)
(display (= (uf-find parent 0) (uf-find parent 2)))
(newline)
(display (= (uf-find parent 0) (uf-find parent 3)))
(newline)
