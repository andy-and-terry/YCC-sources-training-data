;; Goldbach partitions of 100; expect 6.
(defun primep (n)
  (and (> n 1)
       (loop for d from 2 while (<= (* d d) n) never (zerop (mod n d)))))

(print (loop for p from 2 to 50 count (and (primep p) (primep (- 100 p)))))
