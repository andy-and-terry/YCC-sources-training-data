;; R7RS bytevectors: fixed-size sequences of bytes (0-255).

(define bv (make-bytevector 4 0))
(bytevector-u8-set! bv 0 72)
(bytevector-u8-set! bv 1 105)
(bytevector-u8-set! bv 2 33)

(display (bytevector-length bv)) (newline)
(display (bytevector-u8-ref bv 1)) (newline)
(display bv) (newline)

(define greeting (bytevector 82 55 82 83))
(display (utf8->string greeting)) (newline)
(display (string->utf8 "abc")) (newline)

(define combined (bytevector-append (bytevector 1 2) (bytevector 3)))
(display combined) (newline)
(display (bytevector-copy combined 1 3)) (newline)

(define target (make-bytevector 5 0))
(bytevector-copy! target 1 (bytevector 9 8 7))
(display target) (newline)
(display (bytevector? target)) (newline)
(display (equal? (bytevector 1 2) (bytevector 1 2))) (newline)
