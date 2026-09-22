(define base 256)
(define modulus 101)

(define (char-code c) (char->integer c))

(define (rabin-karp text pattern)
  (define n (string-length text))
  (define m (string-length pattern))

  (define (hash-of s len)
    (let loop ((i 0) (h 0))
      (if (= i len)
          h
          (loop (+ i 1) (modulo (+ (* h base) (char-code (string-ref s i))) modulus)))))

  ;; base^(m-1) mod modulus, used to drop the leading character from the rolling hash
  (define high-order
    (let loop ((i 0) (h 1))
      (if (= i (- m 1)) h (loop (+ i 1) (modulo (* h base) modulus)))))

  (define (matches-at? i)
    (let loop ((k 0))
      (cond ((= k m) #t)
            ((char=? (string-ref text (+ i k)) (string-ref pattern k)) (loop (+ k 1)))
            (else #f))))

  (define pattern-hash (hash-of pattern m))

  (if (or (= m 0) (> m n))
      '()
      (let loop ((i 0) (text-hash (hash-of text m)) (result '()))
        (let ((result2 (if (and (= text-hash pattern-hash) (matches-at? i))
                            (cons i result)
                            result)))
          (if (= i (- n m))
              (reverse result2)
              (let* ((old (char-code (string-ref text i)))
                     (new (char-code (string-ref text (+ i m))))
                     (next-hash (modulo (+ (* base (modulo (- text-hash (* old high-order)) modulus)) new)
                                        modulus)))
                (loop (+ i 1) next-hash result2)))))))

(display (rabin-karp "abxabcabcaby" "abc"))
(newline)
(display (rabin-karp "aaaaa" "aa"))
(newline)
