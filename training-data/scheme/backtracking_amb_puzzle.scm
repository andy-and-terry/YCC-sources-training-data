;; Small backtracking search without call/cc: try each choice, collect solutions.

(define (range lo hi)
  (if (> lo hi) '() (cons lo (range (+ lo 1) hi))))

(define (flat-map f lst)
  (apply append (map f lst)))

(define (distinct? a b c)
  (and (not (= a b)) (not (= b c)) (not (= a c))))

;; digits a b c, all different, with a + b = c and a * b = 2c + 4
(define solutions
  (flat-map
   (lambda (a)
     (flat-map
      (lambda (b)
        (flat-map
         (lambda (c)
           (if (and (distinct? a b c)
                    (= (+ a b) c)
                    (= (* a b) (+ (* 2 c) 4)))
               (list (list a b c))
               '()))
         (range 1 9)))
      (range 1 9)))
   (range 1 9)))

(display solutions)
(newline)
