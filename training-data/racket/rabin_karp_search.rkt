#lang racket

;; Rabin-Karp substring search using a polynomial rolling hash.
;; Returns a list of all starting indices where pattern occurs in text.

(define base 256)
(define modulus 1000000007)

(define (char-code c) (char->integer c))

(define (rabin-karp text pattern)
  (define n (string-length text))
  (define m (string-length pattern))
  (cond
    [(or (= m 0) (> m n)) '()]
    [else
     (define high-order (modulo (expt base (sub1 m)) modulus))
     (define (hash-of s start len)
       (for/fold ([h 0]) ([i (in-range start (+ start len))])
         (modulo (+ (* h base) (char-code (string-ref s i))) modulus)))
     (define pattern-hash (hash-of pattern 0 m))
     (let loop ([i 0] [text-hash (hash-of text 0 m)] [matches '()])
       (define matches* (if (and (= text-hash pattern-hash)
                                  (string=? (substring text i (+ i m)) pattern))
                             (cons i matches)
                             matches))
       (if (= i (- n m))
           (reverse matches*)
           (let* ([leaving (char-code (string-ref text i))]
                  [entering (char-code (string-ref text (+ i m)))]
                  [next-hash (modulo (+ (* (- text-hash (* leaving high-order)) base) entering)
                                      modulus)])
             (loop (+ i 1) next-hash matches*))))]))

(displayln (rabin-karp "abracadabra" "abra"))   ; '(0 7)
(displayln (rabin-karp "aaaaa" "aa"))           ; '(0 1 2 3)
(displayln (rabin-karp "hello world" "xyz"))    ; '()
