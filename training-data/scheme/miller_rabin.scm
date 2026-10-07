;; Miller-Rabin primality test: a deterministic test (for numbers below the
;; usual 64-bit range) built from repeated squaring of a modular power,
;; using a fixed witness set instead of random bases.

(define (mod-expt base exp m)
  (let loop ((result 1) (base (remainder base m)) (exp exp))
    (cond
      ((= exp 0) result)
      ((odd? exp) (loop (remainder (* result base) m) (remainder (* base base) m) (quotient exp 2)))
      (else (loop result (remainder (* base base) m) (quotient exp 2))))))

(define (witness? a d n r)
  (let ((x (mod-expt a d n)))
    (if (or (= x 1) (= x (- n 1)))
        #f
        (let loop ((x x) (i 1))
          (if (>= i r)
              #t
              (let ((x2 (remainder (* x x) n)))
                (if (= x2 (- n 1))
                    #f
                    (loop x2 (+ i 1)))))))))

(define (prime? n)
  (cond
    ((< n 2) #f)
    ((= n 2) #t)
    ((even? n) #f)
    (else
     (let find-dr ((d (- n 1)) (r 0))
       (if (even? d)
           (find-dr (quotient d 2) (+ r 1))
           (let check ((witnesses '(2 3 5 7 11 13 17 19 23 29 31 37)))
             (cond
               ((null? witnesses) #t)
               ((>= (car witnesses) n) (check (cdr witnesses)))
               ((witness? (car witnesses) d n r) #f)
               (else (check (cdr witnesses))))))))))

(for-each
  (lambda (n)
    (display n) (display " -> ") (display (prime? n)) (newline))
  '(2 3 4 17 91 97 561 1000000007))
