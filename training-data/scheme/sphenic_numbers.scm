(define (sphenic? n)
  (let loop ((n n) (p 2) (distinct 0))
    (cond ((> (* p p) n) (= (+ distinct (if (> n 1) 1 0)) 3))
          ((= (remainder n p) 0)
           (let ((m (quotient n p)))
             (if (= (remainder m p) 0)
                 #f
                 (loop m (+ p 1) (+ distinct 1)))))
          (else (loop n (+ p 1) distinct)))))

(do ((n 2 (+ n 1))) ((>= n 80))
  (if (sphenic? n) (begin (display n) (display " "))))
(newline)
