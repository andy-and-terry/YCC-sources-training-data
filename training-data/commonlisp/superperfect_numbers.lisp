(defun sigma (n) (loop for d from 1 to n when (zerop (mod n d)) sum d))

(format t "~{~a~^ ~}~%"
        (loop for n from 1 below 100 when (= (sigma (sigma n)) (* 2 n)) collect n))
;; 2 4 16 64
