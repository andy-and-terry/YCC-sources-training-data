;; Named let as the general-purpose loop construct.

(define (show x) (display x) (newline))

(define (collatz-length n)
  (let loop ((n n) (steps 0))
    (cond ((= n 1) steps)
          ((even? n) (loop (quotient n 2) (+ steps 1)))
          (else (loop (+ (* 3 n) 1) (+ steps 1))))))
(show (collatz-length 27))

(define (digits n)
  (let loop ((n n) (acc '()))
    (if (< n 10)
        (cons n acc)
        (loop (quotient n 10) (cons (remainder n 10) acc)))))
(show (digits 90210))

(define (reverse-list lst)
  (let loop ((rest lst) (acc '()))
    (if (null? rest) acc (loop (cdr rest) (cons (car rest) acc)))))
(show (reverse-list '(1 2 3 4)))

(define (find-first pred lst)
  (let loop ((l lst))
    (cond ((null? l) #f)
          ((pred (car l)) (car l))
          (else (loop (cdr l))))))
(show (find-first (lambda (x) (> x 10)) '(3 8 12 20)))

(define (multiplication-row n limit)
  (let loop ((i 1) (acc '()))
    (if (> i limit) (reverse acc) (loop (+ i 1) (cons (* n i) acc)))))
(show (multiplication-row 7 6))

(let outer ((i 1))
  (when (<= i 3)
    (let inner ((j 1))
      (when (<= j i)
        (display (* i j)) (display " ")
        (inner (+ j 1))))
    (newline)
    (outer (+ i 1))))
