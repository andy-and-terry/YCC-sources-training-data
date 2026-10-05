;; map and for-each over several lists at once.

(display (map + '(1 2 3) '(10 20 30))) (newline)
(display (map list '(a b c) '(1 2 3))) (newline)
(display (map (lambda (x y z) (+ x (* y z))) '(1 2) '(3 4) '(5 6))) (newline)

;; Shortest list wins in R7RS
(display (map cons '(1 2 3) '(a b))) (newline)

(for-each (lambda (name score)
            (display name)
            (display ": ")
            (display score)
            (newline))
          '(alice bob carol)
          '(90 85 77))

(define (dot-product u v)
  (apply + (map * u v)))

(display (dot-product '(1 2 3) '(4 5 6))) (newline)

(define (transpose rows)
  (apply map list rows))

(display (transpose '((1 2 3) (4 5 6)))) (newline)
(display (vector-map + #(1 2) #(10 20))) (newline)
