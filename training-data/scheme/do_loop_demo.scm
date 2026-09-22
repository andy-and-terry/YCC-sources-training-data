;; The `do` special form: an iterative loop with explicit per-variable
;; step expressions, an alternative to named-let recursion for simple
;; counted or accumulator-style iteration.

(define (factorial-do n)
  (do ((i n (- i 1))
       (acc 1 (* acc i)))
      ((= i 0) acc)))

(define (sum-of-squares n)
  (do ((i 1 (+ i 1))
       (total 0 (+ total (* i i))))
      ((> i n) total)))

(define (reverse-vector! v)
  (do ((lo 0 (+ lo 1))
       (hi (- (vector-length v) 1) (- hi 1)))
      ((>= lo hi) v)
    (let ((tmp (vector-ref v lo)))
      (vector-set! v lo (vector-ref v hi))
      (vector-set! v hi tmp))))

(display (factorial-do 5))
(newline)
(display (sum-of-squares 5))
(newline)
(display (reverse-vector! (vector 1 2 3 4 5)))
(newline)
