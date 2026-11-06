;; Amicable pairs: d(a) = b and d(b) = a with a != b.
(define (d n)
  (let loop ((i 1) (s 0))
    (cond ((>= i n) s)
          ((zero? (remainder n i)) (loop (+ i 1) (+ s i)))
          (else (loop (+ i 1) s)))))

(do ((a 2 (+ a 1))) ((>= a 1500))
  (let ((b (d a)))
    (if (and (> b a) (= (d b) a))
        (begin (display a) (display " ") (display b) (newline)))))
