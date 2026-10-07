;; Square-and-multiply modular exponentiation.

(define (mod-pow base exp m)
  (let loop ((b (modulo base m)) (e exp) (result 1))
    (cond ((= e 0) result)
          ((odd? e) (loop (modulo (* b b) m) (quotient e 2) (modulo (* result b) m)))
          (else (loop (modulo (* b b) m) (quotient e 2) result)))))

(display (mod-pow 2 10 1000)) (newline)
(display (mod-pow 3 200 13)) (newline)
(display (mod-pow 7 (- 1000000007 2) 1000000007)) (newline)
