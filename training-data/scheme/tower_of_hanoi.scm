;; Classic Tower of Hanoi solved by recursion, collecting the moves made.

(define (hanoi n from to via)
  (if (= n 0)
      '()
      (append (hanoi (- n 1) from via to)
              (list (list from to))
              (hanoi (- n 1) via to from))))

(define moves (hanoi 3 'A 'C 'B))
(display (length moves))
(newline)
(display moves)
(newline)
