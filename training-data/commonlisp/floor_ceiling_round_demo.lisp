(dolist (x '(2.5 3.5 -2.5 -2.7 2.2))
  (format t "~5@a floor=~a ceiling=~a truncate=~a round=~a~%"
          x (floor x) (ceiling x) (truncate x) (round x)))

(format t "~a~%" (multiple-value-list (floor -7 2)))
(format t "~a~%" (multiple-value-list (truncate -7 2)))
(format t "~a ~a~%" (mod -7 2) (rem -7 2))
(format t "~a~%" (ffloor 3.7))
