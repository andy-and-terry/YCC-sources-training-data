;; Fermat primality test; Carmichael number 561 fools it.
(define (powmod b e m)
  (cond ((= e 0) (modulo 1 m))
        ((even? e)
         (let ((h (powmod b (quotient e 2) m)))
           (modulo (* h h) m)))
        (else (modulo (* b (powmod b (- e 1) m)) m))))

(define (probably-prime? n)
  (and (> n 2) (= (powmod 2 (- n 1) n) 1)))

(for-each
 (lambda (n)
   (display n) (display " ") (display (probably-prime? n)) (newline))
 '(97 91 561))
