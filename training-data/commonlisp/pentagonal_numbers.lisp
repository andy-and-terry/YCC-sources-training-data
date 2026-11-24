;;; Pentagonal numbers: n(3n-1)/2.
(format t "~{~a~^ ~}~%"
        (loop for n from 1 to 10 collect (floor (* n (1- (* 3 n))) 2)))
