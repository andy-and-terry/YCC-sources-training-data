#lang racket

(define (parse-line line)
  (map string-trim (string-split line "," #:trim? #f)))

(define data "name, age, city\nann, 30, Rome\nbob, 25, Oslo")
(define rows (map parse-line (string-split data "\n")))
(displayln rows)
(define header (map string->symbol (car rows)))
(define records
  (for/list ([r (in-list (cdr rows))])
    (for/hash ([h (in-list header)] [v (in-list r)])
      (values h v))))
(displayln (map (lambda (r) (hash-ref r 'city)) records))
(displayln (apply + (map (lambda (r) (string->number (hash-ref r 'age))) records)))
(for ([r (in-list records)])
  (printf "~a is ~a\n" (hash-ref r 'name) (hash-ref r 'age)))
(displayln (string-join (map (lambda (r) (string-join r ";")) rows) "|"))
