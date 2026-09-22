(define (rabin-karp-search text pattern)
  (define base 256)
  (define prime 101)
  (define n (string-length text))
  (define m (string-length pattern))

  (define (pow-mod b e md)
    (let loop ((e e) (result 1) (b (modulo b md)))
      (if (= e 0)
          result
          (if (odd? e)
              (loop (- e 1) (modulo (* result b) md) b)
              (loop (quotient e 2) result (modulo (* b b) md))))))

  (define high-order (pow-mod base (- m 1) prime))

  (define (hash-of s start len)
    (let loop ((i start) (h 0) (count 0))
      (if (= count len)
          h
          (loop (+ i 1) (modulo (+ (* h base) (char->integer (string-ref s i))) prime) (+ count 1)))))

  (define pattern-hash (hash-of pattern 0 m))

  (let loop ((i 0) (text-hash (hash-of text 0 m)))
    (cond
      ((> i (- n m)) -1)
      ((and (= text-hash pattern-hash) (string=? (substring text i (+ i m)) pattern)) i)
      ((= i (- n m)) -1)
      (else
       (let ((next-hash (modulo (+ (* base (- text-hash (* (char->integer (string-ref text i)) high-order)))
                                    (char->integer (string-ref text (+ i m))))
                                 prime)))
         (loop (+ i 1) next-hash))))))

(display (rabin-karp-search "abxabcabcaby" "abcaby"))
(newline)
(display (rabin-karp-search "hello world" "xyz"))
(newline)
