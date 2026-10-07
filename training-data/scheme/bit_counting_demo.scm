;; Bit counting implemented with pure arithmetic (quotient/remainder),
;; since bitwise operators aren't part of the R7RS base library.

(define (popcount n)
  (let loop ((n n) (count 0))
    (if (= n 0)
        count
        (loop (quotient n 2) (+ count (remainder n 2))))))

(define (bit-xor a b)
  (if (and (= a 0) (= b 0))
      0
      (+ (if (= (remainder a 2) (remainder b 2)) 0 1)
         (* 2 (bit-xor (quotient a 2) (quotient b 2))))))

(define (hamming-distance a b)
  (popcount (bit-xor a b)))

(display (popcount 255))
(newline)
(display (popcount 1024))
(newline)
(display (hamming-distance 9 15))
(newline)
