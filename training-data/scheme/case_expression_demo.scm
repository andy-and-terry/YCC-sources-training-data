;; `case` dispatches on eqv?-comparable datums, with an else clause.
(define (day-type d)
  (case d
    ((saturday sunday) 'weekend)
    ((monday tuesday wednesday thursday friday) 'weekday)
    (else 'unknown)))

(display (day-type 'sunday)) (newline)
(display (day-type 'tuesday)) (newline)
(display (day-type 'holiday)) (newline)

(define (digit-name n)
  (case n
    ((0) "zero")
    ((1) "one")
    ((2 3 4) "few")
    (else "many")))

(display (map digit-name '(0 1 3 9))) (newline)

;; R7RS `=>` clause passes the key to a procedure.
(define (describe c)
  (case c
    ((#\a #\e #\i #\o #\u) 'vowel)
    (else => (lambda (x) (list 'consonant x)))))

(display (describe #\e)) (newline)
(display (describe #\z)) (newline)
