(define (perfect-square? n)
  (and (>= n 0)
       (let ((r (exact (round (sqrt n)))))
         (= (* r r) n))))

(define (range a b)
  (if (>= a b) '() (cons a (range (+ a 1) b))))

(display (filter perfect-square? (range 0 30)))
(newline)
