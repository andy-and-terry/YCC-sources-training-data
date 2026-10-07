;; zip and unzip on lists
(define (zip a b)
  (if (or (null? a) (null? b))
      '()
      (cons (list (car a) (car b)) (zip (cdr a) (cdr b)))))

(define (unzip pairs)
  (list (map car pairs) (map cadr pairs)))

(define z (zip '(1 2 3) '(a b c d)))
(display z) (newline)
(display (unzip z)) (newline)
(display (map + '(1 2 3) '(10 20 30))) (newline)
