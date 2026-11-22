;;; Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
(format t "~{~a~^ ~}~%" (loop for n from 0 below 10 collect (1+ (floor (* n (1+ n)) 2))))
