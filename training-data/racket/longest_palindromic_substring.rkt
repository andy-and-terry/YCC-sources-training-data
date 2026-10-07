#lang racket

;; Expand-around-center finds the longest palindrome by growing
;; outward from every possible center -- both single-character
;; centers and between-character centers, to cover even lengths too.
(define (expand s left right)
  (let loop ([l left] [r right])
    (if (and (>= l 0) (< r (string-length s)) (char=? (string-ref s l) (string-ref s r)))
        (loop (sub1 l) (add1 r))
        (substring s (add1 l) r))))

(define (longest-palindrome s)
  (for/fold ([best ""]) ([i (in-range (string-length s))])
    (define odd (expand s i i))
    (define even (expand s i (add1 i)))
    (define candidate (if (> (string-length even) (string-length odd)) even odd))
    (if (> (string-length candidate) (string-length best)) candidate best)))

(displayln (longest-palindrome "babad"))
(displayln (longest-palindrome "cbbd"))
