;;; Population count (number of set bits) for 0..15
(format t "~{~a ~}~%" (loop for n from 0 below 16 collect (logcount n)))
