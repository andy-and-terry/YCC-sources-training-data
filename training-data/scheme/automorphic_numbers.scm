(define (automorphic? n)
  (let ((mod (expt 10 (string-length (number->string n)))))
    (= (remainder (* n n) mod) n)))

(let loop ((n 0) (acc '()))
  (if (= n 1000)
      (begin (display (reverse acc)) (newline)) ; (0 1 5 6 25 76 376 625)
      (loop (+ n 1) (if (automorphic? n) (cons n acc) acc))))
