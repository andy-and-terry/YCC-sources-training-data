#lang racket
;; Bulls and Cows scoring for equal-length digit strings.
(define (score secret guess)
  (define pairs (map cons (string->list secret) (string->list guess)))
  (define bulls (count (λ (p) (char=? (car p) (cdr p))) pairs))
  (define rest (filter (λ (p) (not (char=? (car p) (cdr p)))) pairs))
  (define sc (make-hash))
  (define gc (make-hash))
  (for ([p rest])
    (hash-update! sc (car p) add1 0)
    (hash-update! gc (cdr p) add1 0))
  (define cows
    (for/sum ([(c n) sc]) (min n (hash-ref gc c 0))))
  (values bulls cows))

(define-values (b c) (score "1807" "7810"))
(printf "~a bull(s), ~a cow(s)\n" b c)
