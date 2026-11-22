;;; Practical numbers: every m in 1..n is a sum of distinct divisors of n.
(defun practicalp (n)
  (let ((reach 1)) ; bit i set <=> i is a subset sum
    (loop for d from 1 to n
          when (zerop (mod n d)) do (setf reach (logior reach (ash reach d))))
    (let ((mask (1- (ash 1 (1+ n)))))
      (= (logand reach mask) mask))))

(format t "~{~a~^ ~}~%" (loop for n from 1 to 40 when (practicalp n) collect n))
