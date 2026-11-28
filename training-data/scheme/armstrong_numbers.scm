(define (digits n)
  (if (< n 10) (list n) (append (digits (quotient n 10)) (list (remainder n 10)))))

(define (armstrong? n)
  (let* ((ds (digits n)) (len (length ds)))
    (= n (apply + (map (lambda (d) (expt d len)) ds)))))

(let loop ((n 1) (acc '()))
  (if (= n 1000)
      (begin (display (reverse acc)) (newline)) ; (1 ... 9 153 370 371 407)
      (loop (+ n 1) (if (armstrong? n) (cons n acc) acc))))
