;;; Fibbinary numbers: no two adjacent 1 bits.
(format t "~{~a~^ ~}~%"
        (loop for n from 0 below 50
              when (zerop (logand n (ash n -1))) collect n))
