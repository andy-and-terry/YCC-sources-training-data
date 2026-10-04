;; map and for-each with several lists at once.

(display (map + '(1 2 3) '(10 20 30)))
(newline)
(display (map list '(a b c) '(1 2 3)))
(newline)
(display (map (lambda (x y z) (+ x (* y z))) '(1 2) '(3 4) '(5 6)))
(newline)
(display (map + '(1 2 3) '(10 20)))   ; stops at the shortest list
(newline)

(for-each (lambda (name score)
            (display name)
            (display ": ")
            (display score)
            (newline))
          '(ann bob cy)
          '(90 85 77))

(define (zip . lists) (apply map list lists))
(display (zip '(1 2 3) '(a b c) '(x y z)))
(newline)

(define (dot-product u v) (apply + (map * u v)))
(display (dot-product '(1 2 3) '(4 5 6)))
(newline)

(define (transpose m) (apply map list m))
(display (transpose '((1 2 3) (4 5 6))))
(newline)
