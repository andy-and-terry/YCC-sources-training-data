;; LSD radix sort for non-negative integers, sorting digit by digit
;; using counting sort as the stable subroutine.

(define (digit-at n place) (modulo (quotient n place) 10))

(define (counting-pass lst place)
  (let* ((buckets (make-vector 10 '())))
    (for-each
     (lambda (n)
       (let ((d (digit-at n place)))
         (vector-set! buckets d (cons n (vector-ref buckets d)))))
     (reverse lst))
    (apply append (map (lambda (b) (reverse b)) (vector->list buckets)))))

(define (max-value lst) (apply max lst))

(define (radix-sort lst)
  (let loop ((current lst) (place 1))
    (if (>= (max-value current) place)
        (loop (counting-pass current place) (* place 10))
        current)))

(display (radix-sort '(170 45 75 90 802 24 2 66)))
(newline)
