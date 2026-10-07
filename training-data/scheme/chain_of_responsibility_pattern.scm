;; Each handler either satisfies the request or forwards it to the
;; next handler. Handlers are plain procedures taking the amount and
;; the "rest of the chain" as a procedure to call on failure.

(define (small-note-dispenser amount next)
  (if (<= amount 20)
      (begin (display "dispensing ") (display amount)
             (display " using $20 or smaller notes") (newline))
      (next amount)))

(define (large-note-dispenser amount next)
  (if (<= amount 100)
      (begin (display "dispensing ") (display amount)
             (display " using $100 notes") (newline))
      (next amount)))

(define (no-handler amount)
  (display "no handler could process ") (display amount) (newline))

(define (dispense amount)
  (small-note-dispenser
   amount
   (lambda (amt) (large-note-dispenser amt no-handler))))

(dispense 20)
(dispense 80)
(dispense 500)
