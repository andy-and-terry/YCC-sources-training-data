;;; Hamming numbers (5-smooth): only prime factors 2, 3 and 5
(defun strip (n p)
  (loop while (zerop (mod n p)) do (setf n (floor n p)))
  n)

(defun hamming-p (n)
  (= 1 (strip (strip (strip n 2) 3) 5)))

(format t "~{~d~^ ~}~%"
        (loop with count = 0
              for n from 1
              when (hamming-p n)
                collect n and do (incf count)
              until (= count 20)))
