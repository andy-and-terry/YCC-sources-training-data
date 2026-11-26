;; Deficient numbers below 100; expect 76.
(defun proper-sum (n)
  (loop for d from 1 below n when (zerop (mod n d)) sum d))
(print (loop for n from 1 below 100 count (< (proper-sum n) n)))
