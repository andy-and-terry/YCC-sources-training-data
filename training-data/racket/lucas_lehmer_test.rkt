#lang racket

(define (prime? n)
  (and (>= n 2)
       (for/and ([d (in-range 2 (+ 1 (integer-sqrt n)))])
         (not (zero? (remainder n d))))))

(define (lucas-lehmer? p)
  (if (= p 2)
      #t
      (let ([m (- (expt 2 p) 1)])
        (let loop ([i 0] [s 4])
          (if (= i (- p 2))
              (zero? s)
              (loop (+ i 1) (modulo (- (* s s) 2) m)))))))

(displayln (string-join
            (map number->string
                 (filter (lambda (p) (and (prime? p) (lucas-lehmer? p))) (range 2 20)))
            " "))
