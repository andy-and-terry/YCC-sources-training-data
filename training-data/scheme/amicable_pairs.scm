;; Amicable pairs below 1500 via sums of proper divisors.
(define (s n)
  (let loop ((d 1) (t 0))
    (cond ((>= d n) t)
          ((zero? (modulo n d)) (loop (+ d 1) (+ t d)))
          (else (loop (+ d 1) t)))))

(do ((a 2 (+ a 1))) ((>= a 1500))
  (let ((b (s a)))
    (if (and (> b a) (= (s b) a))
        (begin (display a) (display " ") (display b) (newline)))))
