;; Binding multiple return values with call-with-values and let-values (R7RS).
(define (min-max lst)
  (let loop ((rest (cdr lst)) (lo (car lst)) (hi (car lst)))
    (if (null? rest)
        (values lo hi)
        (loop (cdr rest)
              (min lo (car rest))
              (max hi (car rest))))))

(let-values (((lo hi) (min-max '(4 9 2 7))))
  (display (list lo hi))
  (newline))

(let-values (((q r) (floor/ 17 5))
             ((tq tr) (truncate/ -17 5)))
  (display (list q r tq tr))
  (newline))

(define-values (a b) (values 1 2))
(display (+ a b))
(newline)

(let*-values (((x y) (values 1 2))
              ((z) (values (+ x y))))
  (display z)
  (newline))
