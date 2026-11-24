;;; Centered square numbers: n^2 + (n+1)^2.
(format t "~{~a~^ ~}~%"
        (loop for n from 0 below 10 collect (+ (* n n) (* (1+ n) (1+ n)))))
