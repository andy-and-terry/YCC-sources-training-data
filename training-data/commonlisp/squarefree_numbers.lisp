;; Squarefree numbers up to 100; expect 61.
(defun squarefreep (n)
  (loop for d from 2 while (<= (* d d) n) never (zerop (mod n (* d d)))))
(print (loop for n from 1 to 100 count (squarefreep n)))
