;; Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
(let loop ((i 0) (s 2))
  (if (< i 8)
      (begin
        (display "s(") (display i) (display ") = ") (display s) (newline)
        (loop (+ i 1) (+ (- (* s s) s) 1)))))
