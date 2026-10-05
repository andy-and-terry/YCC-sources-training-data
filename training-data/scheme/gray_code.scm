;; Reflected binary Gray code, built recursively.

(define (prefix-all bit codes)
  (map (lambda (c) (cons bit c)) codes))

(define (gray n)
  (if (= n 0)
      '(())
      (let ((prev (gray (- n 1))))
        (append (prefix-all 0 prev)
                (prefix-all 1 (reverse prev))))))

(for-each (lambda (code)
            (for-each display code)
            (newline))
          (gray 3))

(define (gray-int i)
  (let loop ((x i) (shifted (quotient i 2)) (acc 0) (bit 1))
    (if (and (= x 0) (= shifted 0))
        acc
        (loop (quotient x 2) (quotient shifted 2)
              (+ acc (* bit (modulo (+ (modulo x 2) (modulo shifted 2)) 2)))
              (* bit 2)))))

(display (map gray-int '(0 1 2 3 4 5 6 7))) (newline)
