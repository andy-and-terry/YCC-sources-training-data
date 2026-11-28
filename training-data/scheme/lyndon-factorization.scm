(define (lyndon? w)
  (let loop ((i 1))
    (or (>= i (string-length w))
        (and (string<? w (substring w i (string-length w))) (loop (+ i 1))))))

(define (factor s)
  (if (string=? s "")
      '()
      (let loop ((n (string-length s)))
        (if (lyndon? (substring s 0 n))
            (cons (substring s 0 n) (factor (substring s n (string-length s))))
            (loop (- n 1))))))

(write (factor "banana")) (newline)
