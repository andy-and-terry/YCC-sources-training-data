;;; Hexagonal numbers: n(2n-1).
(format t "~{~a~^ ~}~%"
        (loop for n from 1 to 10 collect (* n (1- (* 2 n)))))
