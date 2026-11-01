;; Leyland numbers: x^y + y^x for x >= y >= 2.
(define (leyland x y) (+ (expt x y) (expt y x)))

(define (show-list lst)
  (for-each (lambda (v) (display v) (display " ")) lst)
  (newline))

(define (range a b) (if (> a b) '() (cons a (range (+ a 1) b))))

(show-list
 (apply append
        (map (lambda (x) (map (lambda (y) (leyland x y)) (range 2 x)))
             (range 2 4))))
