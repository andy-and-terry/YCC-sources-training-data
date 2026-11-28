(defun sigma (n)
  (loop for d from 1 to n when (zerop (mod n d)) sum d))

(print (loop for n from 1 to 20 when (< (sigma n) (* 2 n)) collect n))
