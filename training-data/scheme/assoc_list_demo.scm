(define scores '(("Ada" . 88) ("Bob" . 72) ("Cleo" . 95)))

(display (cdr (assoc "Ada" scores)))
(newline)

(for-each
  (lambda (pair) (display (car pair)) (display ": ") (display (cdr pair)) (newline))
  scores)
