(define (reverse-bits v)
  (let loop ((k 8) (v v) (acc 0))
    (if (= k 0)
        acc
        (loop (- k 1) (quotient v 2) (+ (* acc 2) (remainder v 2))))))

(for-each (lambda (v) (display v) (display " ") (display (reverse-bits v)) (newline))
          '(1 6 13 128)) ; 128 96 176 1
