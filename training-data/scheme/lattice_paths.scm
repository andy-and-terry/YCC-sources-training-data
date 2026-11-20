;; Lattice paths via the recurrence f(r,c) = f(r-1,c) + f(r,c-1).
(define (lattice r c)
  (if (or (= r 0) (= c 0)) 1 (+ (lattice (- r 1) c) (lattice r (- c 1)))))
(display (lattice 3 3)) (newline)
