;; The Josephus problem: n people stand in a circle, every k-th person is
;; eliminated, and the survivor's original position is returned.
;; Uses the well-known recurrence J(1) = 0, J(n) = (J(n-1) + k) mod n.

(define (josephus n k)
  (let loop ((i 2) (position 0))
    (if (> i n)
        position
        (loop (+ i 1) (modulo (+ position k) i)))))

;; Convert from the 0-indexed recurrence to a 1-indexed seat number.
(display (+ 1 (josephus 7 3)))
(newline)
(display (+ 1 (josephus 41 3)))
(newline)
