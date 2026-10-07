;; Count letter frequencies using a vector indexed by character code.

(define (letter-counts str)
  (let ((counts (make-vector 26 0)))
    (string-for-each
      (lambda (c)
        (if (char-alphabetic? c)
            (let ((i (- (char->integer (char-downcase c)) 97)))
              (vector-set! counts i (+ 1 (vector-ref counts i))))))
      str)
    counts))

(define (most-common counts)
  (let loop ((i 1) (best 0))
    (cond ((= i 26) (integer->char (+ best 97)))
          ((> (vector-ref counts i) (vector-ref counts best)) (loop (+ i 1) i))
          (else (loop (+ i 1) best)))))

(define counts (letter-counts "Hello, World! Lollipop"))
(write (vector-ref counts 11)) (newline)
(write (most-common counts)) (newline)
(write (vector->list (vector-map (lambda (n) (* n n)) #(1 2 3)))) (newline)
