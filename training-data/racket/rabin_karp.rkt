#lang racket

;; Rabin-Karp scans a text for a pattern by rolling a hash across
;; each window in O(1) instead of hashing every window from scratch,
;; only confirming a match with a direct comparison on hash equality.
(define base 256)
(define modulus 1000000007)

(define (rabin-karp text pattern)
  (define n (string-length text))
  (define m (string-length pattern))
  (define (code s i) (char->integer (string-ref s i)))
  (define high-order (modulo (expt base (sub1 m)) modulus))

  (define (window-hash s start)
    (for/fold ([h 0]) ([i (in-range m)])
      (modulo (+ (* h base) (code s (+ start i))) modulus)))

  (define pattern-hash (window-hash pattern 0))
  (define text-hash (box (window-hash text 0)))
  (define matches '())

  (for ([i (in-range (add1 (- n m)))])
    (when (and (= (unbox text-hash) pattern-hash)
               (string=? (substring text i (+ i m)) pattern))
      (set! matches (cons i matches)))
    (when (< (add1 i) (add1 (- n m)))
      (define rolled
        (modulo (+ (* (- (unbox text-hash) (* (code text i) high-order)) base)
                   (code text (+ i m)))
                modulus))
      (set-box! text-hash (if (< rolled 0) (+ rolled modulus) rolled))))
  (reverse matches))

(displayln (rabin-karp "abracadabra" "abra"))
